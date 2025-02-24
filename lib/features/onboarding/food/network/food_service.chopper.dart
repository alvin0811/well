// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$DefaultFoodService extends DefaultFoodService {
  _$DefaultFoodService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DefaultFoodService;

  @override
  Future<Response<FoodResponse>> food(FoodRequest request) {
    final Uri $url = Uri.parse('v1/food');
    final $body = request;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<FoodResponse, FoodResponse>($request);
  }

  @override
  Future<Response<FoodResponse>> getFoods() {
    final Uri $url = Uri.parse('v1/food');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<FoodResponse, FoodResponse>($request);
  }

  @override
  Future<Response<FoodListResponse>> getFoodList() {
    final Uri $url = Uri.parse('v1/food/list');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<FoodListResponse, FoodListResponse>($request);
  }
}
