import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Profile extends StatefulWidget {
  final String name;

  Profile({@required this.name});

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
            Navigator.pop(context); // berpindah page ke page sebelumnya
            print('Back top previous page');
          },
        ),
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75,
              // digunakan untuk mengambil gambar di internet
              backgroundImage: NetworkImage(
                  'https://animenewsandfacts.com/wp-content/uploads/2020/10/Adachi-to-Shimamura-anime-.jpg'),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
                child: Text(
              widget.name, //mengambil name dari variabel dari class profile
              style: TextStyle(fontSize: 25),
            ))
          ],
        ),
      ),
    );
  }
}
