import 'package:firebaseemail/first_screen.dart';
import 'package:firebaseemail/phone_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose one'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Container(height: 40,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(09)
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(39, 07, 00, 00),
                  child: Text('Verification with Mail ID',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight:FontWeight.bold),),
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FirstScreen()));
              },
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              child: Container(
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(09)
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(27, 07, 00, 00),
                  child: Text('Verification with Phone No.',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PhoneInput()));
              },
            )
          ],
        ),
      ),
    );
  }
}
