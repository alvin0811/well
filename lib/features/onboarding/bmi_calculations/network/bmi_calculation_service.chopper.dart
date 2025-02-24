// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bmi_calculation_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$DefaultBmiCalculationService extends DefaultBmiCalculationService {
  _$DefaultBmiCalculationService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DefaultBmiCalculationService;

  @override
  Future<Response<BmiCalculationResponse>> bmiCalculation(
      BmiCalculationRequest request) {
    final Uri $url = Uri.parse('v1/bmi');
    final $body = request;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<BmiCalculationResponse, BmiCalculationResponse>($request);
  }

  @override
  Future<Response<BmiCalculationResponse>> getBmiCalculation() {
    final Uri $url = Uri.parse('v1/bmi');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<BmiCalculationResponse, BmiCalculationResponse>($request);
  }
}
