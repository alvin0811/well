import 'package:chopper/chopper.dart';
import 'package:well_path/features/settings/media_upload/network/media_upload_finalize_request/media_upload_finalize_request.dart';
import 'package:well_path/features/settings/media_upload/network/media_upload_finalize_response/media_upload_finalize_response.dart';
import 'package:well_path/features/settings/media_upload/network/media_upload_init_request/media_upload_init_request.dart';
import 'package:well_path/features/settings/media_upload/network/media_upload_init_response/media_upload_init_response.dart';
import 'package:well_path/helper/helpers.dart';

part 'media_upload_service.chopper.dart';

abstract class MediaUploadService {
  Future<Response<MediaUploadInItResponse>> uploadInit(
    @Body() MediaUploadInItRequest request,
  );
  Future<Response<MediaUploadInItResponse>> uploadPublicInit(
    @Body() MediaUploadInItRequest request,
  );
  Future<Response<MediaUploadFinalizeResponse>> uploadFinalize(
    @Body() MediaUploadFinalizeRequest request,
  );
  Future<Response<MediaUploadFinalizeResponse>> uploadPublicFinalize(
    @Body() MediaUploadFinalizeRequest request,
  );
}

typedef FPService = MediaUploadService;

@ChopperApi()
abstract class DefaultMediaUploadService extends CS implements FPService {
  static DefaultMediaUploadService create() => _$DefaultMediaUploadService();

  @Post(path: 'v1/media/init')
  @override
  Future<Response<MediaUploadInItResponse>> uploadInit(
    @Body() MediaUploadInItRequest request,
  );

  @Post(path: 'v1/media/public/init')
  @override
  Future<Response<MediaUploadInItResponse>> uploadPublicInit(
    @Body() MediaUploadInItRequest request,
  );

  @Post(path: 'v1/media/finalize')
  @override
  Future<Response<MediaUploadFinalizeResponse>> uploadFinalize(
    @Body() MediaUploadFinalizeRequest request,
  );

  @Post(path: 'v1/media/public/finalize')
  @override
  Future<Response<MediaUploadFinalizeResponse>> uploadPublicFinalize(
    @Body() MediaUploadFinalizeRequest request,
  );
}
