// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_ui/components/textfield.dart';
import 'package:first_ui/constants/constants.dart';
import 'package:first_ui/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

enum Login {
  SHOW_MOBILE_ENTER_WIDGET,
  SHOW_OTP_FORM_WIDGET,
}

class LoginScreen extends StatefulWidget {
  LoginScreen({
    Key? key,
  }) : super(key: key);

  void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String verificationID = "";
  FirebaseAuth _auth = FirebaseAuth.instance;
  Login currentState = Login.SHOW_MOBILE_ENTER_WIDGET;
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: currentState == Login.SHOW_MOBILE_ENTER_WIDGET
            ? showPhoneWidget(context)
            : showOtpWidget(context),
      ),
    );
  }

  showPhoneWidget(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: ListView(children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Welcome To Rythu Bharosa Assist",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
        Padding(padding: EdgeInsets.all(10)),
        Image.asset("assets/login.jpg"),
        SizedBox(height: 20),
        SizedBox(height: 20),
        TextFieldContainer(
          child: TextField(
            keyboardType: TextInputType.phone,
            controller: _phoneController,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              icon: Icon(
                Icons.phone_android,
                color: kPrimaryColor,
              ),
              hintText: "Enter Your Mobile Number",
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Center(
          child: AnimatedButton(
            height: 70,
            width: 200,
            text: 'Login',
            isReverse: true,
            selectedTextColor: Colors.black,
            transitionType: TransitionType.LEFT_TO_RIGHT,
            textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            backgroundColor: Color.fromARGB(255, 255, 115, 0),
            borderColor: Color.fromARGB(255, 230, 64, 64),
            borderRadius: 30,
            borderWidth: 2,
            onPress: () async {
              await _auth.verifyPhoneNumber(
                  phoneNumber: "+91${_phoneController.text}",
                  verificationCompleted: (phoneAuthCredential) async {},
                  verificationFailed: (verificationFailed) {
                    setState(() {});
                    print(verificationFailed);
                  },
                  codeSent: (verificationID, resendingToken) async {
                    setState(() {
                      currentState = Login.SHOW_OTP_FORM_WIDGET;
                      this.verificationID = verificationID;
                    });
                  },
                  codeAutoRetrievalTimeout: (verificationID) async {});
            },
          ),
        )
      ]),
    );
  }

  showOtpWidget(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: ListView(children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Welcome To Rythu Bharosa Assist",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
        Padding(padding: EdgeInsets.all(10)),
        Image.asset("assets/login.jpg"),
        SizedBox(height: 20),
        SizedBox(height: 20),
        TextFieldContainer(
          child: TextField(
            keyboardType: TextInputType.number,
            obscureText: true,
            controller: _otpController,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              icon: Icon(
                Icons.security,
                color: kPrimaryColor,
              ),
              hintText: "Enter OTP",
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Center(
            child: InkWell(
                child: Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width * .45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.red[100],
                    ),
                    child: Text(
                      "Verify",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    )),
                onTap: () {
                  AuthCredential phoneAuthCredential =
                      PhoneAuthProvider.credential(
                          verificationId: verificationID,
                          smsCode: _otpController.text);
                  signInWithPhoneAuthCred(phoneAuthCredential);
                }))
      ]),
    );
  }

  void signInWithPhoneAuthCred(AuthCredential phoneAuthCredential) async {
    try {
      final authCred = await _auth.signInWithCredential(phoneAuthCredential);

      if (authCred.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Some Error Occured. Try Again Later')));
    }
  }
}
