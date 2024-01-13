import 'dart:convert';

import 'package:hapind/model/choice.dart';
import 'package:hapind/service/api/base_api.dart';
import 'package:http/http.dart' as http;

class ChoiceService extends BaseApi {
  late String getPurposeChoiceUrl = url + "/api/mobile/getPurposeChoice";

  // Future<Purpose?>? getPurposeChoice() async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse('$getPurposeChoiceUrl'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //     );
  //     print(response.statusCode);
  //     if (response.statusCode == 200) {
  //       print(Purpose.fromJson(
  //           jsonDecode(response.body) as Map<String, dynamic>));
  //       return Purpose.fromJson(
  //           jsonDecode(response.body) as Map<String, dynamic>);
  //     } else {
  //       return null;
  //     }
  //   } catch (error) {
  //     return null;
  //   }
  // }

    Future<List<Choice>?> getPurposeChoice() async {
  try {
    final response = await http.get(
      Uri.parse('$getPurposeChoiceUrl'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      final List<dynamic> jsonList = jsonDecode(response.body);
      final List<Choice> purposes = jsonList
          .map((json) => Choice.fromJson(json as Map<String, dynamic>))
          .toList();
      //print(purposes);
      return purposes;
    } else {
      return null;
    }
  } catch (error) {
    return null;
  }
}

}
