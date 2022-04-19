import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_cart/layarmasuk.dart';

class ScreenProfile extends StatefulWidget {
  const ScreenProfile({Key? key}) : super(key: key);

  @override
  State<ScreenProfile> createState() => _ScreenProfileState();
}

class _ScreenProfileState extends State<ScreenProfile> {
  late SharedPreferences logindata;
  late String username;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                logindata.setBool('login', true);
                Navigator.pushReplacement(context,
                    new MaterialPageRoute(builder: (context) => login_screen()));
              },
              child: Text('Log Out'),
            )
          ],
        ),
      ),
    );
    ;
  }
}
