import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseemail/first_screen.dart';
import 'package:firebaseemail/list_users_crud.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController fname =  new TextEditingController();
  TextEditingController lname =  new TextEditingController();
  TextEditingController mail =  new TextEditingController();
  TextEditingController phone =  new TextEditingController();

  final firebase = FirebaseFirestore.instance;

  add()async{
    try{
      await firebase.collection("User").doc(phone.text).set({
        "fname" : fname.text,
        "lname" : lname.text,
        "mail" : mail.text,
        "phone" : phone.text,
      });
    }catch(e){
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Data'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 00, 30, 00),
              child: Column(
                children: [
                  Container(width: 220,
                    child: TextFormField(
                      controller: fname,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        labelText: 'Enter FirstName'
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(width: 220,
                    child: TextFormField(
                      controller: lname,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        labelText: 'Enter LastName'
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(width: 220,
                    child: TextFormField(
                      controller: mail,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                          labelText: 'Enter Mail ID'
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(width: 220,
                    child: TextFormField(
                      controller: phone,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                          labelText: 'Enter Phone No.'
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(75, 00, 00, 00),
                  child: InkWell(
                    child: Container(height: 40,
                      width: 85,
                      decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)
                    ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(19, 05, 00, 00),
                        child: Text('Add',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    onTap: (){
                      add();
                      fname.clear();
                      lname.clear();
                      mail.clear();
                      phone.clear();
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(00, 00, 00, 00),
                  child: InkWell(
                    child: Container(height: 40,
                      width: 110,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(14, 04, 10, 00),
                        child: Text('Display',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ListUsersCrud()));
                      fname.clear();
                      lname.clear();
                      mail.clear();
                      phone.clear();
                    },
                  ),
                )
              ],
            )

          ],
        ),
      )
      /*Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text('Done !!!'),
            ),
            InkWell(
              child: Container(height: 40,
                width: 100,
                decoration: BoxDecoration(
                color:Colors.blue,
                borderRadius: BorderRadius.circular(15)
              ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('LOG OUT',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                ),
              ),
              onTap: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FirstScreen()));
                // Navigator.of(context).pushNamedAndRemoveUntil('/main', (route) => false);
              },
            )
          ],
        ),
      ),*/
    );
  }
}
