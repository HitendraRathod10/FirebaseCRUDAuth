import 'package:firebaseemail/login_screen.dart';
import 'package:firebaseemail/signup_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Container(height: 50,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                color: Colors.blue
              ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 08, 00, 00),
                  child: Text('Sign Up',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUp()));
              },
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              child: Container(height: 50,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 08, 00, 00),
                  child: Text('Log In',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LogIn()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
