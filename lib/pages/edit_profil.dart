import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'profile.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = new TextEditingController();
  final globalKey = GlobalKey<ScaffoldState>(); // pendelkarasian context global

  // peggunaan notifikasi toastbar
  showToast(text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.5),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  // penggunaan notifikasi snackbar
  showSnackBar(text) {
    final snackbar = SnackBar(
      content: Text(text),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            print('Clicked!');
          }),
    );
    globalKey.currentState.showSnackBar(snackbar);
  }

  // penggunaan notifikasi alert dialog material desain
  showAlertDialogMaterial(text) {
    showDialog(
        context: globalKey.currentContext,
        builder: (_) => AlertDialog(
              title: Text('Info'),
              content: Text(text),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.pop(globalKey
                          .currentContext); // pop = kembali ke menu awal
                      print('Clicked No');
                    },
                    child: Text('No')),
                FlatButton(
                    onPressed: () {
                      print('Clicked Yes');
                    },
                    child: Text('Yes'))
              ],
              elevation: 5, // menampilkan bayangan di setiap sisi  widget
              backgroundColor: Colors.white,
            ),
        barrierColor: Colors.black.withOpacity(0.8),
        barrierDismissible:
            false // pada saat klik sembarang alert dialog tidak akan tertutup
        );
  }

  // penggunaan notifikasi alert dialog capertino
  showAlertDialogCupertino(text) {
    showDialog(
        context: globalKey.currentContext,
        builder: (_) => CupertinoAlertDialog(
              title: Text('Info'),
              content: Text(text),
              actions: [
                CupertinoDialogAction(
                    onPressed: () {
                      Navigator.pop(globalKey
                          .currentContext); // pop = kembali ke menu awal
                      print('Clicked No');
                    },
                    child: Text('No')),
                CupertinoDialogAction(
                    onPressed: () {
                      print('Clicked Yes');
                    },
                    child: Text('Yes'))
              ],
            ),
        barrierColor: Colors.black.withOpacity(0.8),
        barrierDismissible:
            false // pada saat klik sembarang alert dialog tidak akan tertutup
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey, // memanggil context
      body: Container(
          padding: EdgeInsets.only(top: 64, bottom: 64, left: 24, right: 24),
          child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // membagi rata space yang tersedia untuk widget
              crossAxisAlignment: CrossAxisAlignment
                  .stretch, //memenuhi layar kanan kiri suatu widget
              children: [
                Container(
                  child: Text(
                    'EDIT PROFIL',
                    style: TextStyle(fontSize: 40, color: Colors.blueAccent),
                  ),
                ),
                Container(
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Your Name',
                    ),
                  ),
                ),
                Container(
                  height: 48,
                  child: FlatButton(
                    color: Colors.blueAccent,
                    onPressed: () {
                      if (nameController.text == '') {
                        // showToast('Please input your name!');
                        // showSnackBar('Please input your name!');
                        showAlertDialogCupertino('Please input your name!');
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile())
                        ); // Berpindah halaman ketika di text field memiliki value ke Profile()
                      }
                    },
                    child: Text('Update',
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                  ),
                )
              ])),
    );
  }
}
