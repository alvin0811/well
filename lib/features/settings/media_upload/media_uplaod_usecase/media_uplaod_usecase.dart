import 'dart:io';
import 'package:path/path.dart';
import 'package:chopper/chopper.dart';
import 'package:well_path/base_usecase/base_usecase.dart';
import 'package:well_path/common/constants.dart';
import 'package:well_path/features/settings/media_upload/network/media_upload_finalize_request/media_upload_finalize_request.dart';
import 'package:well_path/features/settings/media_upload/network/media_upload_finalize_response/media_upload_finalize_response.dart';
import 'package:well_path/features/settings/media_upload/network/media_upload_init_request/media_upload_init_request.dart';
import 'package:well_path/features/settings/media_upload/network/media_upload_service.dart';
import 'package:well_path/helper/logger/logger.dart';

typedef MediaUseCase
    = UseCase<MediaUploadUseCaseParams, MediaUploadFinalizeResponse?>;

class MediaUploadUseCase extends MediaUseCase {
  MediaUploadUseCase(this._mediaUploadService);

  final MediaUploadService _mediaUploadService;

  @override
  Future<Response<MediaUploadFinalizeResponse>> execute(
      MediaUploadUseCaseParams params) async {
    final bytes = (await params.file.readAsBytes()).lengthInBytes;

    final fileExtension = extension(params.file.path);

    final name = params.file.path.split('/').last;

    final mimeType = _mimeType(fileExtension);

    final response = await _mediaUploadService.uploadInit(
      MediaUploadInItRequest(
        name: name,
        type: uploadType,
        size: bytes,
      ),
    );

    if (!response.isSuccessful) {
      try {
        throw Exception('Media size too large');
      } catch (e) {
        throw Exception(e);
      }
    }
    final data = response.body!;

    final result = await uploadToS3Channel.invokeMethod(uploadToS3MethodName, [
      params.file.readAsBytesSync(),
      data.bucket,
      data.accessKeyId.toString(),
      data.secretAccessKey,
      data.sessionToken,
      data.region,
      mimeType,
      data.location,
      data.mediaId,
      params.showProgress,
    ]);

    return _finalize(data.mediaId);
  }

  Future<Response<MediaUploadFinalizeResponse>> _finalize(int id) async {
    final response = await _mediaUploadService.uploadFinalize(
      MediaUploadFinalizeRequest(id: id),
    );
    Logger.json(response.toString());
    if (!response.isSuccessful) {
      try {
        throw Exception('Something went wrong');
      } catch (e) {
        throw Exception(e);
      }
    } else {
      return response;
    }
  }

  String _mimeType(String extension) {
    switch (extension.toLowerCase()) {
      case '.jpg':
      case '.jpeg':
        return 'image/jpeg';
      case '.png':
        return 'image/png';
    }
    throw Exception('File format is not supported');
  }
}

class MediaUploadUseCaseParams {
  final File file;
  final bool showProgress;
  MediaUploadUseCaseParams(this.file, {this.showProgress = false});
}
