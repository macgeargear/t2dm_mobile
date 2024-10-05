import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t2dm_mobile/core/config/config.dart';
import 'package:t2dm_mobile/core/error/exceptions.dart';
import 'package:t2dm_mobile/features/auth/data/models/user_models.dart';

abstract interface class AuthDatasources {
  Future<UserModel> login(String username, String password);
  // Future<Either<Failure, String>> register(String username, String password); // patient cannot register now
  Future<UserModel?> getCurrentUserData();
}

class AuthDatasourcesImpl implements AuthDatasources {
  final Dio dio;

  const AuthDatasourcesImpl(this.dio);

  @override
  Future<UserModel> login(String username, String password) async {
    try {
      Response response = await dio.post(
        '${APIConfig.baseUrl}/auth/loginPatient',
        data: {
          'username': username,
          'password': password,
        },
      );
      print(response.data);
      if (response.statusCode != 200) {
        throw ServerException(response.data.toString());
      }

      final token = response.data["accessToken"];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('accessToken', token);

      return UserModel.fromJson(response.data);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel?> getCurrentUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken");

    if (token == null) {
      return null;
    }

    dio.options.headers["Authorization"] = "Bearer $token";

    Response response =
        await dio.get('${APIConfig.baseUrl}/auth/getPatientInfo');

    if (response.statusCode != 200) {
      throw ServerException(response.data.toString());
    }

    return UserModel.fromJson(response.data);
  }
}
