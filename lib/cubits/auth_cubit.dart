import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login(String username, String password) async {
    try {
      emit(AuthLoading());
      final response = await http.post(
        Uri.parse("https://api.cabryder.com/v1/api/Account/login"),
        headers: {
          'accept': '*/*',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
          'token': 'string',
        }),
      );

      print("statuscode: ${response.statusCode}");
      print("res body: ${response.body}");

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final token = body['document']['accessToken'] as String?;

        if (token != null) {
          SharedPreferences preferences = await SharedPreferences.getInstance();

          await preferences.setString('jwt_token', token);

          emit(AuthAuthenticated(token: token));
        }
        else {
          emit(AuthError("Token not found in response"));
        }
      } else {
        emit(AuthError("Failed to login!!!"));
      }
    } catch (err) {
      print("Error!! : ${err}");
      emit(AuthError(err.toString()));
    }
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? token = preferences.getString('jwt_token');

    if (token != null) {
      emit(AuthAuthenticated(token: token));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt_token');
    emit(AuthUnauthenticated());
  }
}
