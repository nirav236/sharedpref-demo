

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  List<String> textList = [];
  TextEditingController controller = TextEditingController();

  var namevalue = "no value saved";

  void saveText(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("text", text);

    setState(() {
      textList.add(text);
    });
  }

  // void saveText(String text) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString("text", text);
  // }

  // void readText() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? savedValue = prefs.getString("text");

  //   if (savedValue != null) {
  //     controller.text = savedValue;
  //   }
  // }

  void readText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedValue = prefs.getString("text");
    var getname = prefs.getString("text");

    namevalue = getname != null ? getname : "no value";

    setState(() {

    });

    if (savedValue != null) {
      controller.text = savedValue;
      setState(() {
        textList.add(savedValue);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    readText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: SafeArea(
          child: Column(
        children: [
          Container(
            child: TextField(
              controller: controller,
              onChanged: (val) {
                saveText(val);
              },
            ),
          ),
          Container(
            height: 200,
            width: double.infinity,
            child: Text("$namevalue"),
          ),
        ],
      )),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => AnotherPage(
      //             controller: controller,),
      //       ),
      //     );
      //   },
      //   child: Icon(Icons.arrow_forward),
      // ),
    );
  }
}

// class AnotherPage extends StatefulWidget {
//   final TextEditingController controller;
//   //final String savedText;

//   AnotherPage({required this.controller});

//   @override
//   _AnotherPageState createState() => _AnotherPageState();
// }

// class _AnotherPageState extends State<AnotherPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Another Page'),
//       ),
//       body: SafeArea(
//         child: Container(
//           padding: EdgeInsets.all(16),
//           child: TextField(
//             controller: widget.controller,
//             onChanged: (val) {

//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
