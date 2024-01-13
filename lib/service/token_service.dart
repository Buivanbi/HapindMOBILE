import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hapind/model/user_token.dart';

class TokenService{
  final storage = new FlutterSecureStorage();

  Future<void> saveUserData(UserToken userToken) async {
    await storage.write(key: 'data', value: UserToken.serialize(userToken));
  }

  // Future<Map<String, String?>> readUserData() async {
  //   return await storage.readAll();
  // }

  Future<String?> readAccessToken() async {
  final Map<String, String?> userDataMap = await storage.readAll();
  
  // Extract accessToken from userDataMap
  final String? accessToken = userDataMap['accessToken'];

  return accessToken;
}


  Future<UserToken?> readUserData() async {
    final Map<String, String?> userDataMap = await storage.readAll();
    
    // Extract accessToken from userDataMap
    final String? accessToken = userDataMap['accessToken'];

    if (accessToken != null) {
      // If accessToken is present, return a UserToken object
      return UserToken(
        id: int.parse(userDataMap['id'] ?? '0'),
        username: userDataMap['username'] ?? '',
        roles: userDataMap['roles'] ?? '',
        tokenType: userDataMap['tokenType'] ?? '',
        accessToken: accessToken,
      );
    } else {
      // If accessToken is not present, return null or handle accordingly
      return null;
    }
  }

  Future<void> clearUserData() async {
    await storage.deleteAll();
  }
}