// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';  <-- jgn lupa di import

class BerkasPage extends StatefulWidget {
  const BerkasPage({Key? key}) : super(key: key);

  @override
  State<BerkasPage> createState() => _BerkasPageState();
}

class _BerkasPageState extends State<BerkasPage> {
  var _pesan = '';

  final textController = TextEditingController();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;

  }

  // buat penunjukan ke lokasi file
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/pesan.txt');
  }
  
  //menuliskan data kedalam file
  Future<File> tulisPesan(String pesan) async {
    final file = await _localFile;
    return file.writeAsString('$pesan');
  }

  Future<String> bacaPesan() async {
    try {
      final file = await _localFile;
      String content = await file.readAsString();
      return content;
    } catch (e) {
      return '';
    }
  }

  @override
  void initState() {
    super.initState();
    bacaPesan().then((value) {
      setState(() {
        _pesan = value;
      });
    });
  }

  Future<File> _ubahPesan(pesan)  {
    setState(() {
      _pesan = pesan;
    });
    return tulisPesan(pesan);
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
              Text(_pesan),
              TextField(
                controller: textController,
              ),
              RaisedButton(child: Text('Proses'), onPressed: () {
                _ubahPesan(textController.text);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
