import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtubeui/screens/HomePage.dart';
import 'package:youtubeui/screens/Login.dart';

class Signup extends StatelessWidget {
  String email,password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "images/youtube_logo.png",
              width: 200.0,
              height: 35.0,
            ),
            SizedBox(
              height: 50.0,
            ),
            TextField(
              cursorColor: Colors.red,
              decoration: InputDecoration(
                labelText: "Enter Username",
                labelStyle: TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                border: OutlineInputBorder(),
                fillColor: Colors.red,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (val){
                email = val;
              },
              cursorColor: Colors.red,
              decoration: InputDecoration(
                labelText: "Enter Email",
                labelStyle: TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                border: OutlineInputBorder(),
                fillColor: Colors.red,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (val){
                password = val;
              },
              cursorColor: Colors.red,
              decoration: InputDecoration(
                labelText: "Enter Password",
                labelStyle: TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                border: OutlineInputBorder(),
                fillColor: Colors.red,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 55.0,
              child: FlatButton(
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18.0),
                ),
                onPressed: () {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  });
                },
                color: Colors.red,
                colorBrightness: Brightness.dark,
                disabledColor: Colors.red,
                highlightColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.red)),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Login()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Have an account?  "),
                  Text(
                    "LOGIN HERE !",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
