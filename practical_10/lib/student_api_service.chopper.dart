// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: type=lint
final class _$StudentApiService extends StudentApiService {
  _$StudentApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = StudentApiService;

  @override
  Future<Response<dynamic>> getUsers() {
    final Uri $url = Uri.parse('/users');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
