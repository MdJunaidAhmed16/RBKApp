// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_ui/components/textfield.dart';
import 'package:first_ui/constants/constants.dart';
import 'package:first_ui/screens/grid.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  final String verificationID;
  OtpScreen({
    Key? key,
    required this.verificationID,
  }) : super(key: key);

  void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final String verificationID = "";
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    TextEditingController _otpController = TextEditingController();
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
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
            height: 12,
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
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      )),
                  onTap: () {
                    AuthCredential phoneAuthCredential =
                        PhoneAuthProvider.credential(
                            verificationId: verificationID,
                            smsCode: _otpController.text);
                    signInWithPhoneAuthCred(phoneAuthCredential);
                  }))
        ]),
      ),
    ));
  }

  void signInWithPhoneAuthCred(AuthCredential phoneAuthCredential) async {
    try {
      final authCred = await _auth.signInWithCredential(phoneAuthCredential);

      if (authCred.user != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => GridScreen()));
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Some Error Occured. Try Again Later')));
    }
  }
}
