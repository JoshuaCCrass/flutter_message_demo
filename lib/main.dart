import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if(!kIsWeb){
    await Firebase.initializeApp();
  }
  else{
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCYe4PK4t8rIuQEtO4pb4kh7xLsXV8rDX4",
          authDomain: "star-conquest-69c96.firebaseapp.com",
          appId: "1:535026242752:web:7766cb5c48180925004925",
          messagingSenderId: "535026242752",
          projectId: "star-conquest-69c96",
          storageBucket: "star-conquest-69c96.appspot.com",
          measurementId: "G-PDNW4SL9K6"
      )
    );
  }

  runApp(
    MaterialApp(
      title: 'Named Routes Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/login/messages': (context) => const MessagesScreen(),
        '/login/messages/conversations': (context) => const converationsScreen(),
      },
    ),
  );
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Next screen'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(5)),
            const SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'UserName',
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            const SizedBox(
              width: 200,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login/messages');
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.all(5)),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login/messages/conversations');
                },
                child: Column(
                  children: const [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('John'),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text('Food or Not'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class converationsScreen extends StatelessWidget {
  const converationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('John'),
      ),
    );
  }
}