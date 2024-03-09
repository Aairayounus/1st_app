import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tast_app/font_class.dart';
import 'package:tast_app/login.dart';
import 'package:tast_app/task_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({super.key});

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  final firstnamecontroller = TextEditingController();
  final lastnamecontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  final passwordnamecontroller = TextEditingController();
  var firstNameValue = 'No first name';
  var lastNameValue = 'No last name';
  var userNameValue = 'No username';
  var passwordValue = 'No password';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Sign Up',
                        style: CustomTextStyle.headlineStyle(),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Create your account",
                style: CustomTextStyle.subtitleStyle(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextFormField(
                  controller: firstnamecontroller,
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    hintStyle: CustomTextStyle.textFormStyle(),
                    fillColor: Colors.grey.withOpacity(.1),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffe4e7eb)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: TextFormField(
                  controller: lastnamecontroller,
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    hintStyle: CustomTextStyle.textFormStyle(),
                    fillColor: Colors.grey.withOpacity(.1),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: TextFormField(
                  controller: usernamecontroller,
                  decoration: InputDecoration(
                    hintText: 'User Name',
                    hintStyle: CustomTextStyle.textFormStyle(),
                    fillColor: Colors.grey.withOpacity(.1),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffe4e7eb)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: TextFormField(
                  controller: passwordnamecontroller,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: CustomTextStyle.textFormStyle(),
                    fillColor: Colors.grey.withOpacity(.1),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffe4e7eb)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  obscureText: false,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () async {
                  var firstName = firstnamecontroller.toString();
                  var lastName = lastnamecontroller.toString();
                  var userName = usernamecontroller.toString();
                  var password = passwordnamecontroller.toString();
                  var pref = await SharedPreferences.getInstance();
                  pref.setString("firstName", firstName);
                  pref.setString("lastName", lastName);
                  pref.setString("userName", userName);
                  pref.setString("password", password);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TaskScreen(
                              userName: usernamecontroller.text.toString())));
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
                  'Sign Up',
                  style: CustomTextStyle.buttonStyle(),
                ),
              ),
              const SizedBox(
                height: 05,
              ),
              Center(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(65, 0, 0, 0),
                      child: Text(
                        'Already have an account?',
                        style: CustomTextStyle.textStyle(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      child: Text(
                        'Login',
                        style: CustomTextStyle.buttonStyle(),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  void getValue() async {
    var pref = await SharedPreferences.getInstance();
    var getfirstName = pref.getString("firstName");
    var getlastName = pref.getString("lastName");
    var getuserName = pref.getString("userName");
    var getpassword = pref.getString("password");
    firstNameValue = getfirstName ?? 'no value';
    lastNameValue = getlastName ?? 'no value';
    userNameValue = getuserName ?? 'no value';
    passwordValue = getpassword ?? 'no value';
    setState(() {});
  }
}
