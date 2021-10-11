import 'package:chatapp/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final UserModel userModel;
  final User firebaseUser;

  const SearchPage({Key? key, required this.userModel, required this.firebaseUser}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            children: [

              TextField(
                decoration: InputDecoration(
                  labelText: "Email Address"
                ),
              ),

              SizedBox(height: 20,),

              CupertinoButton(
                onPressed: () {},
                color: Theme.of(context).colorScheme.secondary,
                child: Text("Search"),
              ),

              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}