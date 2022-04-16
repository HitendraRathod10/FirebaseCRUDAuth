import 'package:flutter/material.dart';

class PhoneHome extends StatefulWidget {
  const PhoneHome({Key? key}) : super(key: key);

  @override
  _PhoneHomeState createState() => _PhoneHomeState();
}

class _PhoneHomeState extends State<PhoneHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Text('Done !!'),
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
              Navigator.of(context).pushNamedAndRemoveUntil('/main', (route) => false);
            },
          )
        ],
      ),
    );
  }
}
