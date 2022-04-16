import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseemail/home_screen.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

  final _auth = FirebaseAuth.instance;
class _LogInState extends State<LogIn> {
  String? email;
  String? password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In here'),
      ),
      body: Column(
        children: [
          Container(width: 280,
            child: TextFormField(
              onChanged: (value){
                email = value;
              },
              decoration:InputDecoration(
                hintText: 'Enter Email id',
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
              decoration:InputDecoration(
                hintText: 'Enter password',
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
                child: Text('Log In',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
              ),
            ),
            onTap: () async {
              setState(() {
                showSpinner = true;
              });
              try {
                final user = await _auth.signInWithEmailAndPassword(
                    email: email!, password: password!);
                if (user != null) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
                  // Navigator.pushNamed(context, 'home_screen');
                }
              } catch (e) {
                print(e);
              }
              setState(() {
                showSpinner = false;
              });

              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
            },
          )
        ],
      ),
    );
  }
}
