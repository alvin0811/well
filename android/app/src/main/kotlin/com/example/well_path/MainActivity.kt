package com.example.well_path

import io.flutter.embedding.android.FlutterFragmentActivity
import android.content.Intent
import android.util.Log
import com.amazonaws.auth.BasicSessionCredentials
import com.amazonaws.mobile.client.AWSMobileClient
import com.amazonaws.regions.Region
import com.amazonaws.mobileconnectors.s3.transferutility.TransferUtility
import com.amazonaws.services.s3.AmazonS3Client
import io.flutter.embedding.android.FlutterActivityLaunchConfigs
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.MethodChannel
import android.net.Uri
import java.io.File

class MainActivity: FlutterFragmentActivity(), EventChannel.StreamHandler {

    private val imageUploadingChannel = "app.wellPath.channel/imageuploading"

    private val uploadToS3EventName = "event/uploadS3"

    private val uploadToS3MethodName = "uploadS3"

    private lateinit var eventChannel: EventChannel

    private var events: EventSink? = null

    override fun getBackgroundMode(): FlutterActivityLaunchConfigs.BackgroundMode {
        return FlutterActivityLaunchConfigs.BackgroundMode.transparent
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        eventChannel = EventChannel(flutterEngine.dartExecutor.binaryMessenger, uploadToS3EventName)
        eventChannel.setStreamHandler(this)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger, imageUploadingChannel
        ).setMethodCallHandler { call, result ->
            if (call.method == uploadToS3MethodName) {
                if (call.arguments != null) {
                    val data = call.arguments as? ArrayList<*>
                    if (data != null && data.count() > 8) {
                        val imageData = data[0] as? ByteArray
                        val bucketName = data[1] as? String
                        val accessKey = data[2] as? String
                        val secretKey = data[3] as? String
                        val sessionToken = data[4] as? String
                        val region = data[5] as? String
                        val mimeType = data[6] as? String
                        val pathKey = data[7] as? String
                        val mediaId = data[8] as? Int
                        if (imageData != null && bucketName != null && accessKey != null && secretKey != null && sessionToken != null && region != null && mimeType != null && pathKey != null && mediaId != null) {

                            val amazonS3Client = AmazonS3Client(
                                BasicSessionCredentials(
                                    accessKey, secretKey, sessionToken
                                ), Region.getRegion(region)
                            )
                            val transferUtility =
                                TransferUtility.builder().defaultBucket(bucketName)
                                    .context(applicationContext)
                                    .awsConfiguration(AWSMobileClient.getInstance().configuration)
                                    .s3Client(amazonS3Client).build()
                            val observer = transferUtility.upload(
                                pathKey,
                                imageData.inputStream(),
                            )
                            observer.setTransferListener(S3TransferListener(events) {
                                result.success(mediaId)
                            })
                        } else {
                            Log.d("", "arguments Casting Issue.")
                            result.error("ARGUMENTS", "arguments Casting Issue.", null)
                        }
                    } else {
                        Log.d(
                            "",
                            "arguments not available or maybe parameter count less than required parameters."
                        )
                        result.error(
                            "ARGUMENTS",
                            "arguments not available or maybe parameter count less than required parameters.",
                            null
                        )
                    }
                } else {
                    Log.d("", "arguments not available.")
                    result.error("ARGUMENTS", "arguments not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        Log.i("Extras", data?.extras.toString())
    }

    override fun onListen(arguments: Any?, events: EventSink?) {
        this.events = events
    }

    override fun onCancel(arguments: Any?) {
        events?.endOfStream()
    }
}
