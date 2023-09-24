import 'package:flutter/material.dart';
import 'package:praktikum_pert3/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var namauser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _showInput(_usernameController, 'Masukkan Username', false),
            _showInput(_passwordController, 'Masukkan Password', true),
            ElevatedButton(
                onPressed: () {
                  if (_usernameController.text == 'alvin' &&
                      _passwordController.text == 'alvin123') {
                    // save username
                    _saveUsername();
                    // show alert
                    _showDialog('Anda berhasil login', const HomePage());
                  } else {
                    // show alert
                    _showDialog(
                        'Username dan Password salah', const LoginPage());
                  }
                },
                child: const Text('Login'))
          ],
        ),
      ),
    );
  }

  void _saveUsername() async {
    // Inisialisasi Shared Preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Simpan username ke local storage
    prefs.setString('username', _usernameController.text);
  }

  _showInput(namaController, placeholder, isPassword) {
    return TextField(
      controller: namaController,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: placeholder,
      ),
    );
  }

  _showDialog(pesan, alamat) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(pesan),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => alamat));
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }
}
