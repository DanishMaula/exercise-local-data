// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // <-- jgn lupa di import

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pesan = '';
  final textController = TextEditingController();

  //shared preferences
  _ubahPesan(isiPesan) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('pesan', isiPesan);
    });
  }

  _muatPesan() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pesan = pref.getString('pesan') ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    _muatPesan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(pesan),
              TextField(
                controller: textController,
              ),
              RaisedButton(
                  child: const Text('Proses'),
                  onPressed: () {
                    _ubahPesan(textController.text);
                    _muatPesan();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
