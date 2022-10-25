import 'dart:async';
import 'dart:convert';

import 'package:first_project_g1/LoginPage.dart';
import 'package:first_project_g1/homepage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var islogin = false;
var _formKey = GlobalKey<FormState>();

Future<bool> login(String userName, String passWord) async {
  final response = await http.post(
    Uri.parse('https://fakestoreapi.com/auth/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        <String, String>{'username': userName, 'password': passWord}),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    islogin = true;

  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create user.');
  }
  return true;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  Future<bool>? login1;
  var username;
  var password;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Đăng nhập',
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: buildUser(),
        ),
      ),
    );
  }

  Container buildUser() {
    return Container(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/evn-logo.png",
                width: 300,
                height: 300,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Vui lòng nhập tên đăng nhập";
                    else if (value.length < 5) return "Tên đăng nhập quá ngắn";
                    username = value;
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    label: Text("Tên đăng nhập"),
                    hintText: "Vui lòng nhập tên đăng nhập",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Vui lòng nhập mật khẩu";
                      else if (value.length < 5) return "Mật khẩu không đúng";
                      password = value;
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      label: Text("Mật khẩu"),
                      hintText: "Vui lòng nhập mật khẩu",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() async{
                       await (login(username, password));
                      if (islogin) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Homepage()));
                      } else {}
                    });
                    //Form ok
                  } else {
                    //Form not ok
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Đăng nhập",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              Text.rich(
                TextSpan(
                    style: TextStyle(
                      fontSize: 27,
                    ),
                    children: [
                      TextSpan(text: "Bạn chưa có tài khoản?"),
                      TextSpan(
                          style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                          //make link blue and underline
                          text: "Đăng ký",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              //on tap code here, you can navigate to other page or URL
                            }),
                      //more text paragraph, sentences here.
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
