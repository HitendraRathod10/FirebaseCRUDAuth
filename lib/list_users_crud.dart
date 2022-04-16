import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseemail/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebaseemail/model.dart';


class ListUsersCrud extends StatefulWidget {
  // const ListUsersCrud({Key? key}) : super(key: key);

  @override
  _ListUsersCrudState createState() => _ListUsersCrudState();
}

class _ListUsersCrudState extends State<ListUsersCrud> {

  TextEditingController fname =  new TextEditingController();
  TextEditingController lname =  new TextEditingController();
  TextEditingController mail =  new TextEditingController();
  TextEditingController phone =  new TextEditingController();

  DisplayDialog(BuildContext context){
    return showDialog(
        context: context,
        builder:  (context) {

          return SingleChildScrollView(
            child: AlertDialog(

              title: Column(
                children: [
                  Container(
                    child: Text(
                      'Update User Data'
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Container(height: 50,
                        child: TextFormField(controller: fname,
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(height: 50,
                        child: TextFormField(
                          controller: lname,
                          decoration: InputDecoration(
                              labelText: 'Last Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(height: 50,
                        child: TextFormField(
                          controller: mail,
                          decoration: InputDecoration(
                              labelText: 'Mail ID',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        child: TextFormField(
                          enabled: false,
                          controller: phone,
                          decoration: InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),actions: [
                FlatButton(color: Colors.blue,
                    onPressed: ()
                    {
                      update(phone.text);
                      // update(x);
                      /*fname.clear();
                      lname.clear();
                      mail.clear();
                      phone.clear();*/

                    },
                    child: Text('Update',style: TextStyle(color: Colors.white,fontSize: 20),)
                ),
                FlatButton(
                    onPressed: ()
                    {
                      Navigator.of(context).pop();
                      },
                    child: Text('Cancel',style: TextStyle(fontSize: 20),)
                )
            ],
            ),
          );
        }
    );

  }

  delete(DocumentSnapshot x)async{
    try{
      firebase.collection("User").doc(x.id).delete();
    }catch(e){
      print(e);
    }
  }
  update(String phone)async{
    try{
      firebase.collection("User").doc('$phone').
      update({
        "fname": fname.text,
        "lname": lname.text,
        "mail": mail.text,
        "phone": phone,
      }).whenComplete(() => Navigator.of(context).pop());
    }catch(e){
      print(e);
    }

  }
  /*late final _fname;
  late final _lname;
  late final _mail;
  late final _phone;*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final firebase = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('List of Users'),
        actions: [
          IconButton(onPressed: ()
          {
            Navigator.of(context).pushNamedAndRemoveUntil('/main', (route) => false);
          },
              icon: Icon(Icons.home))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        // color: Colors.redAccent,
        child: StreamBuilder<QuerySnapshot>(
          stream: firebase.collection('User').snapshots(),
          builder: (context,snapshot){
               if(snapshot.hasData){
              return ListView.separated(itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,index){
              QueryDocumentSnapshot x = snapshot.data!.docs[index];
              return Container(
                // color: Colors.redAccent,
                child: Row(
                  children: [
                    Container(
                      width: 280,
                      // color: Colors.redAccent,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Text('First Name : '),
                              ),
                              Container(
                                // height: 20,
                                // width: 150,
                                child: Text(x['fname']),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text('Last Name : '),
                              ),
                              Container(
                                // height: 20,
                                // width: 150,
                                child: Text(x['lname']),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text('Mail ID : '),
                              ),
                              Container(
                                // height: 20,
                                // width: 150,
                                child: Text(x['mail']),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text('Phone no. : '),
                              ),
                              Container(
                                // height: 20,
                                // width: 150,
                                child: Text(x['phone']),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          InkWell(
                            child: Container(
                              child:Icon(Icons.edit,size: 30),
                            ),
                            onTap: (){
                              fname.text = x['fname'];
                              lname.text = x['lname'];
                              mail.text = x['mail'];
                              phone.text = x['phone'];
                              DisplayDialog(context);
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            child: Container(
                              child: Icon(Icons.delete
                              ,size: 30,),
                            ),
                            onTap: (){
                              delete(x);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
              separatorBuilder: (BuildContext context, int index) => Divider(
                  color: Colors.black,
                ),
              );
            }
            else{
              return CircularProgressIndicator();
            }

          },
        ),
      )
    );
  }
}
