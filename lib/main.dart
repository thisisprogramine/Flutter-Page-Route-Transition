import 'package:flutter/material.dart';
import 'package:flutter_app/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(),
    );
  }
}


class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<int> list = List<int>.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    getLists();
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
        leading: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              getLists();
            });
          },
        ),
      ),
      body: ListView.builder(
        itemCount: list.length,
          itemBuilder: (context, index) {

          return ListTile(
              title: Text('${list[index]}'),
            );
          }
      ),
    );
  }

  void getLists(){
    list.addAll(setlist());
  }

  List<int> setlist() {
    List<int> l = List<int>.empty(growable: true);
    l.add(1);
    l.add(2);
    l.add(3);
    l.add(4);
    l.add(5);
    l.add(6);
    l.add(7);
    l.add(8);
    l.add(9);
    l.add(10);
    return l;
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SecondScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeIn;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
