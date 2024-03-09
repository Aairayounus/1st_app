import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tast_app/task_screen.dart';

import 'package:tast_app/font_class.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome Back!',
                        style: CustomTextStyle.headlineStyle(),
                      )
                    ],
                  )),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Enter your credential to Login",
                  style: CustomTextStyle.subtitleStyle(),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                  child: TextFormField(
                    controller: usernamecontroller,
                    decoration: InputDecoration(
                      hintText: 'User Name',
                      hintStyle: CustomTextStyle.textFormStyle(),
                      fillColor: Colors.grey.withOpacity(.1),
                      filled: true,
                      prefixIcon: Icon(Icons.supervised_user_circle_sharp),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffe4e7eb)),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 70,
                  ),
                  child: TextFormField(
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: CustomTextStyle.textFormStyle(),
                      fillColor: Colors.grey.withOpacity(.1),
                      filled: true,
                      prefixIcon: Icon(Icons.password_rounded),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffe4e7eb)),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                    onPressed: () async {
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      sp.setString(
                          'userName', usernamecontroller.text.toString());
                      sp.setString(
                          'password', passwordcontroller.text.toString());
                      sp.setBool('islogin', true);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TaskScreen(
                                  userName:
                                      usernamecontroller.text.toString())));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade100,
                      foregroundColor: Colors.grey.withOpacity(.3),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: CustomTextStyle.buttonStyle(),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
