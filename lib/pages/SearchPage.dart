import 'package:chatapp/models/UserModel.dart';
import 'package:chatapp/pages/ChatRoomPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  TextEditingController searchController = TextEditingController();

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
                controller: searchController,
                decoration: InputDecoration(
                  labelText: "Email Address"
                ),
              ),

              SizedBox(height: 20,),

              CupertinoButton(
                onPressed: () {
                  setState(() {});
                },
                color: Theme.of(context).colorScheme.secondary,
                child: Text("Search"),
              ),

              SizedBox(height: 20,),

              StreamBuilder(
                stream: FirebaseFirestore.instance.collection("users").where("email", isEqualTo: searchController.text).where("email", isNotEqualTo: widget.userModel.email).snapshots(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.active) {
                    if(snapshot.hasData) {
                      QuerySnapshot dataSnapshot = snapshot.data as QuerySnapshot;

                      if(dataSnapshot.docs.length > 0) {
                        Map<String, dynamic> userMap = dataSnapshot.docs[0].data() as Map<String, dynamic>;

                        UserModel searchedUser = UserModel.fromMap(userMap);

                        return ListTile(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return ChatRoomPage();
                              }
                            ));
                          },
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(searchedUser.profilepic!),
                            backgroundColor: Colors.grey[500],
                          ),
                          title: Text(searchedUser.fullname!),
                          subtitle: Text(searchedUser.email!),
                          trailing: Icon(Icons.keyboard_arrow_right),
                        );
                      }
                      else {
                        return Text("No results found!");
                      }
                      
                    }
                    else if(snapshot.hasError) {
                      return Text("An error occured!");
                    }
                    else {
                      return Text("No results found!");
                    }
                  }
                  else {
                    return CircularProgressIndicator();
                  }
                }
              ),

            ],
          ),
        ),
      ),
    );
  }
}