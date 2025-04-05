import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lutfilurltool/screens/home_page.dart';
import 'package:lutfilurltool/screens/settings_page.dart';
import 'package:lutfilurltool/screens/urlshorter_page.dart';

void main() async {
  //initialize hive local database
  await Hive.initFlutter();

  //open box from hive
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lutfil URL tool',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      initialRoute: "/",
      //home: const MyHomePage(title: 'URL tool'),
      routes: {
        //"/": (context) => MyHomePage(title: "Lutfil's URL Tool"),
        "/": (context)=> UrlshorterPage(),
        //"/urlshorter": (context) => UrlshorterPage(),
        "/settings": (context) => SecondScreen(),
      },
    );
  }
}
