import 'package:flutter/material.dart';
import 'package:app_01/pages/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  var _isObscure = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Flexible(
          child: Image.asset(
            'images/02_guava.jpg',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          child: const Text(
            'Selamat Datang!',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            controller: _username,
            validator: (content) {
              if (content == null || content.isEmpty) {
                return 'Username tidak boleh kosong!';
              }
              return null;
            },
            decoration: const InputDecoration(
                fillColor: Colors.black12,
                icon: Icon(Icons.person),
                labelText: 'Username',
                hintText: 'Masukkan Username'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            validator: (content) {
              if (content == null || content.isEmpty) {
                return 'Password tidak boleh kosong!';
              }
              return null;
            },
            controller: _password,
            obscureText: _isObscure,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off),
                ),
                icon: const Icon(Icons.lock),
                labelText: 'Password',
                hintText: 'Masukkan Password'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                minimumSize: const Size(200, 40),
                textStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w700)),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Berhasil Login!'),
                    duration: Duration(seconds: 3),
                    backgroundColor: Colors.greenAccent,
                  ),
                );
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Home();
                }));
              }
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Username / Password Kosong!'),
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.redAccent,
                ),
              );
            },
            child: const Text(
              'Submit',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
        ),
      ]),
    ));
  }
}
