import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Future<FirebaseApp> _app = Firebase.initializeApp();
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder(
            future: _app,
            builder: ((context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error');
              } else if (snapshot.hasData) {
                return homeContent();
              } else {
                return CircularProgressIndicator();
              }
            }))
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  homeContent() async {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref().child('data_node').child('users');
    databaseReference.onValue.listen((event) {
      print(event.snapshot.value.toString());
    });

    final snap = await databaseReference.get();
    if (snap.exists) {
      print(snap.value);
    }

    databaseReference.child('count').set(20);
    databaseReference.child('count').remove();
    return Container(
      child: Column(
        children: [Text("kn")],
      ),
    );
  }
}
