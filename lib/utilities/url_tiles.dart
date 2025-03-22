import 'package:flutter/material.dart';

class UrlTile extends StatelessWidget {
  //constructor
  UrlTile({
    super.key,
    required this.originalUrl,
    required this.shortenUrl,
    required this.email,
    required this.shortedUrl,
  });

  //original URL for user input
  final String originalUrl;
  //shorten URL get from shortenURL utils
  final String shortenUrl;
  //email is from uer
  //TODO:email variable is to be replaced with session/ user credential
  final String email;

  //this is to check and send signal to UI either true or false that the
  //URL shortener have pass or fail in shortening
  final bool shortedUrl;

  //function endpoint after url has been shorted
  //TODO: function kena kaitkan dengan result dari shortedurl and validator
  Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      //padding for urlTile wrap
      padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
                0.2,
              ), // Shadow color with transparency
              spreadRadius: 2, // How much the shadow spreads
              blurRadius: 5, // How blurry the shadow is
              offset: Offset(3, 3), // X and Y offset of the shadow
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          spacing: 10,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              padding: EdgeInsets.all(7),
              child: Text(originalUrl),
            ),

            Container(
              
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(shortenUrl),
            ),
            Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(email),
            ),
            Checkbox(value: shortedUrl, onChanged: onChanged),
          ],
        ),

        //Container for URl
      ),
    );
  }
}
