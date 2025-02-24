// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medications_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$DefaultMeditationService extends DefaultMeditationService {
  _$DefaultMeditationService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DefaultMeditationService;

  @override
  Future<Response<MeditationResponse>> medications(MeditationRequest request) {
    final Uri $url = Uri.parse('v1/medications');
    final $body = request;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<MeditationResponse, MeditationResponse>($request);
  }

  @override
  Future<Response<MeditationResponse>> getMedications() {
    final Uri $url = Uri.parse('v1/medications');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<MeditationResponse, MeditationResponse>($request);
  }

  @override
  Future<Response<MedicationListResponse>> getMedicationsList() {
    final Uri $url = Uri.parse('v1/medications/list');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<MedicationListResponse, MedicationListResponse>($request);
  }
}
