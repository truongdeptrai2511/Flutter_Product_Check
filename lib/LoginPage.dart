import 'dart:convert';
import 'package:first_project_g1/homepage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/images/evn-logo.png",width: 300,height: 300,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (value){
                        if (value==null || value.isEmpty)
                          return "Vui lòng nhập tên đăng nhập";
                        else if (value.length<5)
                          return "Tên đăng nhập quá ngắn";
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
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
                        validator: (value){
                          if (value==null || value.isEmpty)
                            return "Vui lòng nhập mật khẩu";
                          else if (value.length<5)
                            return "Mật khẩu không đúng";
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          label: Text("Mật khẩu"),
                          hintText: "Vui lòng nhập mật khẩu",
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Homepage()));
                    if (_formKey.currentState!.validate()){
                      //Form ok
                    }
                    else {
                      //Form not ok
                    }
                  },style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                  ),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("Đăng nhập",style: TextStyle(fontSize: 20),),
                        ),
                      ),
                  ),
                  Text.rich(
                      TextSpan(
                          style: TextStyle(fontSize: 27,),
                          children: [
                            TextSpan(
                              text: "Bạn chưa có tài khoản?"
                            ),
                            TextSpan(
                                style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                                //make link blue and underline
                                text: "Đăng ký",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    //on tap code here, you can navigate to other page or URL
                                  }
                            ),
                            //more text paragraph, sentences here.
                          ]
                      )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}
Future<User> createUser(String title) async {
  final response = await http.post(
    Uri.parse('http://localhost:57958/#/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'Login Success': title,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create user.');
  }
}

class User {
  final String UserName;
  final String Password;

  const User({required this.UserName, required this.Password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      UserName: json['UserName'],
      Password: json['Password'],
    );
  }
}



//Todo: Get a title from user input



