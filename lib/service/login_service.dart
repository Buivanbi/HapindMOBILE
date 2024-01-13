import 'dart:convert';
import 'package:hapind/model/user_login.dart';
import 'package:hapind/model/user_token.dart';
import 'package:hapind/service/api/base_api.dart';
import 'package:hapind/service/token_service.dart';
import 'package:http/http.dart' as http;

class LoginService extends BaseApi {
  late String logiByEmailnUrl = url + "/api/auth/emailLogin";
  late String checkUserUrl = url + "/api/mobile/getUser/";
  late String checkAccountExitsUrl = url + "/api/auth/checkAccountExits/";

  LoginService();
  
  Future<String?>? checkAccountExits(String? username) async {
    try {
      final response = await http.get(
        Uri.parse('$checkAccountExitsUrl${username}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        return null;
      } else {
        return response.body;
      }
    } catch (error) {
      return null;
    }
  }

  Future<UserToken?>? loginByEmail(String email, String password) async {
    try {
      UserLogin userLogin = UserLogin(email: email, password: password);

      final response = await http.post(
        Uri.parse(logiByEmailnUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userLogin.toJson()),
      );
      if (response.statusCode == 200) {
        print("API response: ${response.body}");
             //jsonDecode(response.body) as Map<String, dynamic>);
        return UserToken.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        print("Error: ${response.statusCode}");
        print("API response: ${response.body}");
        return null;
      }
    } catch (error) {
      print("Error during HTTP request: $error");
      return null;
    }
  }

  Future<String>? checkUser(int? id, String? bearerToken) async {
    try {
      final response = await http.get(
        Uri.parse('$checkUserUrl${id ?? ""}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Bearer $bearerToken', // Add Bearer token to the header
        },
      );
      if (response.statusCode == 200) {
        print("API response: ${response.body}");
        // saveUserData(UserToken.fromJson(
        //     jsonDecode(response.body) as Map<String, dynamic>));
        return "Succ";
      } else if (response.statusCode == 403) {
        print("Error: ${response.statusCode}");
        print("API response: ${response.body}");
        return response.body;
      } else {
        return "Bu";
      }
    } catch (error) {
      print("Error during HTTP request: $error");
      return "Bu";
    }
  }

}
