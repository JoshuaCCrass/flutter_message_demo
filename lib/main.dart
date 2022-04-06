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

  /*try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "JCCrass3139@gmail.com",
        password: "password"
    );
  } on FirebaseAuthException catch(e){
    if (e.code == 'weak-password') {
      print("weak password");
    } else if (e.code == 'email-already-in-use') {
      print("email already in use");
    }
  } catch (e) {
    print(e);
  }*/

  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "JCCrass3139@gmail.com",
        password: "password"
    );
    print("Got in");
  } on FirebaseAuthException catch(e){
    if (e.code == 'user-not-found') {
      print(e.code);
    } else if (e.code == 'wrong-password') {
      print(e.code);
    }
  } catch (e) {
    print(e);
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

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailTextBoxController;
  late TextEditingController passwordTextBoxController;
  late String errorText;

  @override
  void initState(){
    super.initState();
    emailTextBoxController = TextEditingController();
    passwordTextBoxController = TextEditingController();
    errorText = '';
  }

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
            SizedBox(
              width: 200,
              child: TextField(
                controller: emailTextBoxController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'UserName',
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            SizedBox(
              width: 200,
              child: TextField(
                obscureText: true,
                controller: passwordTextBoxController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login/messages');
                  },
                  child: const Text('Sign In'),
                ),
                const Padding(padding: EdgeInsets.all(5));
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login/messages');
                  },
                child: const Text('Sign up'),
              ),
              ],
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