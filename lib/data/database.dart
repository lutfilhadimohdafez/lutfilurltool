
import 'package:hive/hive.dart';

class UrlDatabase{

  //here flow local memory -> push to postgresql online

  //url list
  List urlList=[];
  
  //reference for mybox
  final _mybox = Hive.box('mybox');

  //kalau tak pernah ada url list, buatkan list
  void createInitialUrlData(){

    //list structure ,[original_url,shorten_url,id]
    urlList = [
      ["pendek.net/sqrT6y","google.com","lutfil@gmail.com",false],
      ["pendek.net/sqrfGh","youtube.com","hadi@gmail.com",false],
      ["pendek.net/sqrfGh","youtube.com","hadi@gmail.com",false],
      ["pendek.net/sqrfGh","youtube.com","hadi@gmail.com",false],

    ];
  }

  //load urldatabasetable
  void loadUrlData(){
    urlList = _mybox.get("URLLIST");
  }

  //update urldatabasetable
  void updateUrlData(){
    _mybox.put("URLLIST", urlList);
  }


}