import 'package:firebaseemail/phone_home.dart';
import 'package:firebaseemail/phone_verify.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';

class PhoneInput extends StatefulWidget {
  const PhoneInput({Key? key}) : super(key: key);

  @override
  _PhoneInputState createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {

  TextEditingController phone = new TextEditingController();
  TextEditingController otptext = new TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId = "";

  Future<void> fetchotp() async {
    await auth.verifyPhoneNumber(
      phoneNumber: "+91 " + phone.text.toString(),
      timeout: Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },

      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },

      codeSent: (String verificationId, int? resendToken) async {
        this.verificationId = verificationId;
      },

      codeAutoRetrievalTimeout: (String verificationId) {
      },
    );
  }
  
  void signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential) async{
    try{
      final authCredential = await auth.signInWithCredential(phoneAuthCredential);
      if (authCredential.user != null){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PhoneHome()));
      }
    }
    on FirebaseAuthException catch(e){
      print(e);
    }
  }

  Future<void> verify() async {
    PhoneAuthCredential phoneAuthCredential =
    PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otptext.text.toString());
    signInWithPhoneAuthCredential(phoneAuthCredential);
  }

  /*_verifyPhoneNumber(BuildContext context) {

    // String phoneNumber = phone.text.toString();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: "+91 " + phone.text.toString(),

        verificationCompleted: (PhoneAuthCredential credential) {},
        // => _verificationComplete(authCredential, context),
        verificationFailed: (FirebaseAuthException e) {},
        // => _verificationFailed(authException, context),
        codeAutoRetrievalTimeout: (String verificationId) {},
        // => _codeAutoRetrievalTimeout(verificationId),
        codeSent: (String verificationId, int? resendToken) {},
        // => _smsCodeSent(verificationId, [code!]));
        timeout: const Duration(seconds: 10)
    );
  }*/

  /*String? _smsVerificationCode;
  FirebaseAuth auth = FirebaseAuth.instance;
  String? authStatus;
  String? _phoneAuthCredential;*/

  /*_verificationComplete(AuthCredential phoneAuthCredential) {
    print('verificationCompleted');
    _phoneAuthCredential = phoneAuthCredential as String?;
    print(phoneAuthCredential);

    *//*FirebaseAuth.instance
        .signInWithCredential(Credential)
        .then((authResult) {
      final snackBar = SnackBar(
          content: Text("Success!!! UUID is: " + authResult.user!.uid));
      Scaffold.of(context).showSnackBar(snackBar);
    });*//*
    setState(() {
      authStatus = "Your account is successfully verified";
    });
  }*/

  /*_verificationFailed(FirebaseAuthException e) {
    if (e.code == 'invalid-phone-number') {
      print('The provided phone number is not valid.');
    }
    setState(() {
      authStatus = "Authentication failed";
    });
    *//*final snackBar = SnackBar(
        content:
            Text("Exception!! message:" + authException.message.toString()));*//*
    //Scaffold.of(context).showSnackBar(snackBar);
  }*/

  /*_smsCodeSent: (String verId, [int forceCodeResent]) {
  verificationId = verId;
  setState(() {
  authStatus = "OTP has been successfully send";
  });*/

  /*_smsCodeSent(String verificationId, int? resendToken) async {
    _verificationId = verificationId;
    String smsCode = 'xxxx';
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
    await auth.signInWithCredential(credential);
    setState(() {
      authStatus = "OTP has been successfully send";
    });
  }*/

  /*_codeAutoRetrievalTimeout(String verificationId) {
    verificationId = verificationId;
    setState(() {
      authStatus = "TIMEOUT";
    });
  }*/

  /*String? otp;
  String? _verificationId;*/
  // String smsCode = '';

/*  Future<void> signIn(String otp) async {
    await FirebaseAuth.instance
        .signInWithCredential(
      *//*PhoneAuthProvider.PROVIDER_ID(
          verificationId: verificationId,
          smsCode: otp*//*
        PhoneAuthProvider.getCredential(
          verificationId: verificationId,
          smsCode: otp,
        ));
  }*/

  /*void _submitOTP() {
    String smsCode = otptext.text.toString().trim();
    _phoneAuthCredential = PhoneAuthProvider.credential(verificationId: _verificationId!, smsCode: smsCode) as String?;
        *//*verificationId: this.verificationId,
        smsCode: smsCode*//*
    // _login();
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PhoneHome()));
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone no. verification'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 280,
              child: TextFormField(
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    labelText: 'Enter Phone',
                    prefixText: '+91'
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(19, 05, 00, 00),
                  child: Text(
                    'Send OTP',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              onTap: () {
                fetchotp();
                // _verifyPhoneNumber(context);
               /* Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PhoneVerify()));*/
              },
            ),
        Container(
          child: TextFormField(controller: otptext,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: 'Enter OTP Here',
            ),
            onChanged: (value){
               // otp = value;
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
            verify();
            // _submitOTP();
            // signIn(otp!);
          },
          )
          ],
        ),
      ),
    );
  }
}
