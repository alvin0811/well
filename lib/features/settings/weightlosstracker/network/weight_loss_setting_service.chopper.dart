// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_loss_setting_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$DefaultWeightLossSettingService
    extends DefaultWeightLossSettingService {
  _$DefaultWeightLossSettingService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DefaultWeightLossSettingService;

  @override
  Future<Response<WeightLossSettingResponse>> getBmiCalculation() {
    final Uri $url = Uri.parse('v1/bmi');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<WeightLossSettingResponse, WeightLossSettingResponse>($request);
  }
}
