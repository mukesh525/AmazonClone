import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/constants/utils.dart';
import 'package:flutter_amazon_clone/model/user.dart';
import 'package:http/http.dart' as http;

import '../../../constants/error_handling.dart';
import '../../../constants/global_variable.dart';

class AuthService {
  //signup User

  void signupUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          type: '',
          token: '',
          address: '');

      http.Response res = await http.post(Uri.parse('$URI/api/signup'),
          body: jsonEncode(user),
          headers: <String, String>{
            'Content-Type': 'application/json',
          });
      print(res.body);
      httpErrorHandle(
          response: res,
          context: context,
          onSucess: () {
            showSnackBar(context, "Account created");
          });
      // print(res.statusCode);
    } catch (e) {
      print(e);
    }
  }
}
