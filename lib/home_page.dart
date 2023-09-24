import 'package:flutter/material.dart';
import 'package:praktikum_pert3/sidemenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var namauser;

  @override
  Widget build(BuildContext context) {
    _loadUsername();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.red,
      ),
      body: Center(child: Text('Ini adalah halaman User $namauser')),
      drawer: const Sidemenu(),
    );
  }

  void _loadUsername() async {
    // Inisialisasi shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Ambil username yang sudah tersimpan
    namauser = prefs.getString('username');

    // Set username on UI
    setState(() {});
  }
}
