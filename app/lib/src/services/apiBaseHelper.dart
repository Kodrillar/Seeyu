import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:seeyu/src/models/notification_model.dart';

class ApiBaseHelper {
  ApiBaseHelper({required this.astraToken});
  String astraToken;

  Future<List<NotificationModel>> getNotifications(url) async {
    var mappedResponse;
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "X-cassandra-token": astraToken
        },
      );

      final responseBody = _returnResponse(response);
      mappedResponse = responseBody;
    } on SocketException {
      print("Enable Internet connection");
    } catch (err) {
      print(err);
    }

    return mappedResponse;
  }

  _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body)["rows"]
            .map<NotificationModel>(NotificationModel.fromJson)
            .toList();
      case 400:
        throw "Bad Request, kindly check your Query";

      case 500:
        throw "Internal Server Error, try again after some time";

      case 401:
        throw "Unauthorised operation";

      case 403:
        throw "Forbidden! ";

      default:
        throw "An Error Occured while Trying to communicate with the server, try again";
    }
  }
}
