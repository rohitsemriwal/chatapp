import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({ Key? key }) : super(key: key);

  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Complete Profile"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 40
          ),
          child: ListView(
            children: [

              SizedBox(height: 20,),

              CupertinoButton(
                onPressed: () {},
                padding: EdgeInsets.all(0),
                child: CircleAvatar(
                  radius: 60,
                  child: Icon(Icons.person, size: 60,),
                ),
              ),

              SizedBox(height: 20,),

              TextField(
                decoration: InputDecoration(
                  labelText: "Full Name",
                ),
              ),

              SizedBox(height: 20,),

              CupertinoButton(
                onPressed: () {},
                color: Theme.of(context).colorScheme.secondary,
                child: Text("Submit"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}