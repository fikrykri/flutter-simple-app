import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            print('Back top previous page');
          },
        ),
        title: Text('Profile'),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
                child: Text(
              'Your Name',
              style: TextStyle(fontSize: 20),
            ))
          ],
        ),
      ),
    );
  }
}
