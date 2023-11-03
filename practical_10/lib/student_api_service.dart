import "dart:async";
import 'package:chopper/chopper.dart';

part "student_api_service.chopper.dart";

@ChopperApi(baseUrl: "/users")
abstract class StudentApiService extends ChopperService {
  static StudentApiService create([ChopperClient? client]) =>
      _$StudentApiService(client);
  @Get()
  Future<Response> getUsers();
}
