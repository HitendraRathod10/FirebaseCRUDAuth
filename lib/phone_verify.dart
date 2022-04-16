import 'package:flutter/material.dart';
import 'package:firebaseemail/main.dart';
import 'package:firebaseemail/phone_verify.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:firebaseemail/phone_input.dart';


class PhoneVerify extends StatefulWidget {
  const PhoneVerify({Key? key}) : super(key: key);

  @override
  _PhoneVerifyState createState() => _PhoneVerifyState();
}

class _PhoneVerifyState extends State<PhoneVerify> {

  FirebaseAuth auth = FirebaseAuth.instance;
  // String? verificationId;
  String? otp;

  /*Future<void> signIn(String otp) async {
    await FirebaseAuth.instance
        .signInWithCredential(
        PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: otp,
    ));
  }*/

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Verify'),
      ),
      body: Column(
        children: [
          Container(
            child: TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Enter OTP Here',
              ),
              onChanged: (value){
                otp = value;
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            child: Container(height: 40,
              width: 100,
              decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15)
            ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(07, 04, 05, 05),
                child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
              ),
            ),
            onTap: (){
              //signIn(otp!);
            },
          )
        ],
      ),
    );
  }
}
