import 'package:flutter/material.dart';
import 'package:app_01/pages/login.dart';

class Started extends StatelessWidget {
  const Started({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Flexible(
            child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset('images/01_started.png',
                    width: 400, height: 400)),
          ),
          const Text(
            'Choose Your',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.redAccent),
          ),
          const Text('Daily Products!',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.deepPurple)),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                minimumSize: const Size(300, 50),
                textStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.w700)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Login();
              }));
            },
            child: const Text(
              'Next',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          )
        ]),
      ),
    );
  }
}
