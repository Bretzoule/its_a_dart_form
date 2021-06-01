import 'dart:convert';
import 'package:http/http.dart' as http;

class TokenHandler {
  final String userId;
  final String token;

  TokenHandler({required this.userId, required this.token});

  @override
  String toString() {
    return ('userID : ' + this.userId + ' token : ' + this.token);
  }

  factory TokenHandler.fromJson(Map<String, dynamic> json) {
    return TokenHandler(
      userId: json['userId'],
      token: json['token'],
    );
  }
}

class ToLogin {
  Map<String, dynamic> requestBody = {};
  final url = 'https://ouioui.free.beeceptor.com';
  late Future<TokenHandler> completeResponse;
  ToLogin(String username, String password) {
    this.requestBody = {'username': username, 'password': password};
  }

  Future<TokenHandler> request() async {
    try {
      final http.Response response =
          await http.post(Uri.parse(url + '/yikes'), body: this.requestBody);
      if ((response.statusCode == 200) &&
          (response.body.isNotEmpty) &&
          response.headers.containsValue('application/json')) {
        return TokenHandler.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            'Header or request Error: ${response.headers}, statusCode : ${response.statusCode}');
      }
    } on Exception {
      rethrow;
    }
  }
}
