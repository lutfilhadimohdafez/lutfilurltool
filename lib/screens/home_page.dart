import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lutfilurltool/data/database.dart';
import 'package:lutfilurltool/utilities/dialog_box.dart';
import 'package:lutfilurltool/utilities/url_tiles.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//Text controller nanti untuk popup dialog for shorten url
final _controller = TextEditingController();

class _MyHomePageState extends State<MyHomePage> {
  //below is for state for list from db

  //reference to previously opened box which is opened from main file.
  final _myBox = Hive.box('mybox');

  //now initialize a new instance to create list from hive
  UrlDatabase db = UrlDatabase();

  @override
  void initState() {
    //kalau first time open, initialze db
    if (_myBox.get("URLLIST") == null) {
      db.createInitialUrlData();
    } else {
      //kalau tak, ada data then load sample.
      db.loadUrlData();
    }

    super.initState();
  }

  //THIS IS FOR to wait if the urlshortener dah dapat value or no

  void shortedUrl(bool? value, int index) {
    setState(() {
      //TODO:leave it here to check if the short url available or not
    });
  }

  void createNewURL(){
    showDialog(context: context, builder: (context){
      return DialogBox();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.white,
        elevation: 8,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))
        ),
        
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: db.urlList.length,
        itemBuilder: (context, index) {
          return UrlTile(
            originalUrl: db.urlList[index][0],
            shortenUrl: db.urlList[index][1],
            email: db.urlList[index][2],
            shortedUrl: db.urlList[index][3],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewURL,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
