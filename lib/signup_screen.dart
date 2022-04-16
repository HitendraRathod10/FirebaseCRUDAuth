import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  bool showSpinner = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailtxt = new TextEditingController();
  TextEditingController pswdtxt = new TextEditingController();

  /*void ontapemail(value){
    email = value;
  }
  void ontappswd(value){
    password = value;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up here'),
      ),
      body: Column(
        children: [
          Container(width: 280,
            child: TextFormField(
              onChanged: (value){
              email=value;
            },
              controller: emailtxt,
              decoration:InputDecoration(
                hintText: 'Email id',
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
             width: 280,
            child: TextFormField(
              onChanged: (value){
                password = value;
              },
              controller: pswdtxt,
              decoration:InputDecoration(
                hintText: 'Email password',
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            child: Container(height: 40,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 02, 00, 00),
                child: Text('Sign Up',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
              ),
            ),
            onTap: () async {
              setState(() {
                showSpinner = true;
              });
              try {
                final newUser = await _auth.createUserWithEmailAndPassword(
                    email: email!, password: password!);
                if (newUser != null) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogIn()));
                  // Navigator.pushNamed(context, 'home_screen');
                }
              } catch (e) {
                print(e);
              }
              setState(() {
                showSpinner = false;
              });

              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogIn()));
            },
          )
        ],
      ),
    );
  }
}
