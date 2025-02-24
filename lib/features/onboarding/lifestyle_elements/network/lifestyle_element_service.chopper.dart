// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifestyle_element_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$DefaultLifestyleElementService extends DefaultLifestyleElementService {
  _$DefaultLifestyleElementService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DefaultLifestyleElementService;

  @override
  Future<Response<LifestyleElementsResponse>> updateLifestyleElement(
      UpdateLifestyleElementsRequest request) {
    final Uri $url = Uri.parse('v1/lifestyle');
    final $body = request;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<LifestyleElementsResponse, LifestyleElementsResponse>($request);
  }

  @override
  Future<Response<GetLifestyleElementListResponse>> getLifestyleElements() {
    final Uri $url = Uri.parse('v1/lifestyle/list');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<GetLifestyleElementListResponse,
        GetLifestyleElementListResponse>($request);
  }

  @override
  Future<Response<LifestyleElementsResponse>> getLifestyleElementsList() {
    final Uri $url = Uri.parse('v1/lifestyle');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<LifestyleElementsResponse, LifestyleElementsResponse>($request);
  }

  @override
  Future<Response<GetSelectedLifestyleElementsResponse>>
      getSelectedLifestyleElements() {
    final Uri $url = Uri.parse('v1/lifestyle/selected');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<GetSelectedLifestyleElementsResponse,
        GetSelectedLifestyleElementsResponse>($request);
  }

  @override
  Future<Response<ChangeLifestyleElementPriorityResponse>>
      changeLifestyleElementsPriority(
          ChangeLifestyleElementsPriorityRequest request) {
    final Uri $url = Uri.parse('v1/lifestyle/change-priority');
    final $body = request;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ChangeLifestyleElementPriorityResponse,
        ChangeLifestyleElementPriorityResponse>($request);
  }
}
