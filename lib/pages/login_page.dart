import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipbook/pages/home_page.dart';
import 'package:recipbook/services/auth_service.dart';
import 'package:status_alert/status_alert.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    username.text = "kminchelle";
    password.text = "0lelplR";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80),
            Image.asset(
              // width: 100,
              // height: 100,
              "assets/images/logo.png",
              scale: 2,
            ),
            const Text(
              'RecipBOOK',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold
                  // fontFamily: 'Poppins',
                  ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                        controller: username,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 3) {
                            return "Enter a Username";
                          }
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black87,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusColor: Colors.greenAccent,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 25),
                            hintText: 'Username',
                            hintStyle: TextStyle(color: Colors.white)),
                        style: TextStyle(
                          color: Colors.white,
                          // fontFamily: 'poppins',
                        )),
                    SizedBox(height: 20),
                    TextFormField(
                        obscureText: isVisible ? false : true,
                        controller: password,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.length < 5) {
                            return "Enter a valid Password";
                          }
                        },
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              icon: isVisible
                                  ? Icon(FontAwesomeIcons.solidEyeSlash)
                                  : Icon(FontAwesomeIcons.solidEye),
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.black87,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusColor: Colors.greenAccent,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 25),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.white)),
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'poppins',
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Align(
                alignment: Alignment.topRight,
                child: const Text(
                  'forgot password ?',
                  style: TextStyle(
                    fontSize: 15,
                    // fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple.shade900),
                  onPressed: () async {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => DashboardPageAdmin()));
                    if (formkey.currentState?.validate() ?? false) {
                      bool result = await AuthService()
                          .login(username.text, password.text);

                      if (result) {
                        StatusAlert.show(
                          context,
                          margin: EdgeInsets.all(100),
                          duration: Durations.long4,
                          title: "Login Successfull",
                          configuration: IconConfiguration(
                              icon: FontAwesomeIcons.circleCheck,
                              color: Colors.deepPurple.shade900,
                              size: 100),
                        );
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => HomePage()));
                      } else {
                        StatusAlert.show(
                          context,
                          margin: EdgeInsets.all(100),
                          duration: Durations.long4,
                          title: "Login Failed",
                          subtitle: "Please Try Again",
                          configuration: IconConfiguration(
                              icon: Icons.error,
                              color: Colors.redAccent,
                              size: 100),
                        );
                      }
                    }
                  },
                  icon: Icon(
                    FontAwesomeIcons.rightToBracket,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Login',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                )),
            SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}