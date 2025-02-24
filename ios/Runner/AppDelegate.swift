import UIKit
import Flutter
import Photos
import AWSCore
import AWSS3
import Firebase


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate,UIImagePickerControllerDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

      FirebaseApp.configure()
            // AWS Image Uploading
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        
        let imageUploadingChannel = FlutterMethodChannel(
            name: "app.wellPath.channel/imageuploading",
            binaryMessenger: controller.binaryMessenger)


            imageUploadingChannel.setMethodCallHandler({ [weak self]
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            guard call.method == "uploadS3" else {
                result(FlutterMethodNotImplemented)
                return
            }
            if let data = call.arguments as? NSArray,
               let image = data[0] as? FlutterStandardTypedData,
               let bucketName = data[1] as? String,
               let accessKey = data[2] as? String,
               let secretKey = data[3] as? String,
               let sessionToken = data[4] as? String,
               let region = data[5] as? String,
               let mimeType = data[6] as? String,
               let pathKey = data[7] as? String,
               let mId = data[8] as? Int,
               let showProgress = data[9] as? Bool
            {
                let mediaId = String(mId)
                self?.uploadFileS3(withData: image.data, bucketName: bucketName, accessKey: accessKey, secretKey: secretKey, sessionToken: sessionToken, region: region, mimeType: mimeType, pathKey: pathKey, mediaId: mediaId,showProgress: showProgress, uploadCompleted: { [mediaId] isUplaoded in
                    result(isUplaoded ? mediaId : nil);
                    
                    print("Image Uploaded == \(isUplaoded)")
                })
                print("Uploding Started")
            } else {
                result(FlutterError(code: "CASTING ERROR",
                                    message: "Data types missmatch issue",
                                    details: nil))
            }
        })

    GeneratedPluginRegistrant.register(with: self)
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

      func uploadFileS3(withData data: Data,
                      bucketName: String,
                      accessKey: String,
                      secretKey: String,
                      sessionToken: String,
                      region: String,
                      mimeType: String,
                      pathKey: String,
                      mediaId: String,
                      showProgress: Bool,
                      uploadCompleted: @escaping (Bool)->Void) {
        
        guard let Vc = self.window?.rootViewController else { return }
        
        let expression = AWSS3TransferUtilityUploadExpression()
        expression.setValue("public-read", forRequestHeader: "x-amz-acl")
        
        let alert = UIAlertController(title: "Uploading", message: "0.0", preferredStyle: UIAlertController.Style.alert)
        let progressDownload : UIProgressView = UIProgressView(progressViewStyle: .default)
        progressDownload.setProgress(0, animated: true)
        progressDownload.frame = CGRect(x: 10, y: 70, width: 250, height: 10)
        let height:NSLayoutConstraint = NSLayoutConstraint(
            item: alert.view!, attribute: NSLayoutConstraint.Attribute.height,
            relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1, constant: 100)
        alert.view.addConstraint(height)
        alert.view.addSubview(progressDownload)
        
        if(showProgress){
            Vc.present(alert, animated: true, completion: nil)
        }
        
        
        expression.progressBlock = { (_, progress) in
            DispatchQueue.main.async(execute: {
                alert.message = String(format:"%.2f",progress.fractionCompleted * 100) + "%"
                progressDownload.setProgress(Float(progress.fractionCompleted)/1.0, animated: true)
                
                if(progress.fractionCompleted == 1.0) {
                    Vc.dismiss(animated: true, completion:nil)
                }
                print("\(progress.fractionCompleted)")
            })
        }
        
        var completionHandler: AWSS3TransferUtilityUploadCompletionHandlerBlock?
        completionHandler = { (task, error) -> Void in
            print(error?.localizedDescription ?? "")
            DispatchQueue.main.async(execute: {
                switch task.status {
                case .inProgress, .waiting:
                    break
                case .completed:
                    uploadCompleted(true)
                default:
                    uploadCompleted(false)
                }
            })
        }
        
        let config = AWSServiceConfiguration(
            region: region.aws_regionTypeValue(),
            credentialsProvider:
                AWSBasicSessionCredentialsProvider(
                    accessKey: accessKey,
                    secretKey: secretKey,
                    sessionToken: sessionToken
                )
        )
        
        AWSS3TransferUtility.register(with: config!, forKey: mediaId)
        
        if let transferUtility = AWSS3TransferUtility.s3TransferUtility(forKey: mediaId) {
            transferUtility.uploadData(
                data,
                bucket: bucketName,
                key: pathKey,
                contentType: mimeType,
                expression: expression,
                completionHandler: completionHandler
            ).continueWith { (task) -> Any? in
                if task.error != nil {
                    print(task.error?.localizedDescription ?? "")
                    uploadCompleted(false)
                }
                return nil
            }
        } else {
            uploadCompleted(false)
        }
    }
    

}
