import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 125,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(),

            //rows for button
            Row(
              children: [
                //kalau boleh kat sini , if neeeded extra details boleh tambah feature

                //b
              ],
            ),
          ],
        ),
      ),

    );
  }
}