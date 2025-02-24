// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_upload_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$DefaultMediaUploadService extends DefaultMediaUploadService {
  _$DefaultMediaUploadService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DefaultMediaUploadService;

  @override
  Future<Response<MediaUploadInItResponse>> uploadInit(
      MediaUploadInItRequest request) {
    final Uri $url = Uri.parse('v1/media/init');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<MediaUploadInItResponse, MediaUploadInItResponse>($request);
  }

  @override
  Future<Response<MediaUploadInItResponse>> uploadPublicInit(
      MediaUploadInItRequest request) {
    final Uri $url = Uri.parse('v1/media/public/init');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<MediaUploadInItResponse, MediaUploadInItResponse>($request);
  }

  @override
  Future<Response<MediaUploadFinalizeResponse>> uploadFinalize(
      MediaUploadFinalizeRequest request) {
    final Uri $url = Uri.parse('v1/media/finalize');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<MediaUploadFinalizeResponse,
        MediaUploadFinalizeResponse>($request);
  }

  @override
  Future<Response<MediaUploadFinalizeResponse>> uploadPublicFinalize(
      MediaUploadFinalizeRequest request) {
    final Uri $url = Uri.parse('v1/media/public/finalize');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<MediaUploadFinalizeResponse,
        MediaUploadFinalizeResponse>($request);
  }
}
