import 'package:flutter/material.dart';

class DeviceHome {
  String nama;
  String image;
  String status;

  void Function() onswitch;

  DeviceHome(
      {required this.nama,
      required this.image,
      required this.status,
      required this.onswitch});

  factory DeviceHome.empty() {
    return DeviceHome(
        nama: 'nama',
        image: 'image/kipas.png',
        status: 'status',
        onswitch: (() {}));
  }
}

enum Type {
  register,
  login
}

class Utils {
  static GlobalKey<ScaffoldMessengerState> messagerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(content: Text(text), backgroundColor: Colors.red);
    messagerKey.currentState!
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
  
  }
}