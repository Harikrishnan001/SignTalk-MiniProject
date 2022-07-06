import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboard_screen.dart';

class OptionWidget extends StatelessWidget {
  String txt;
  IconData icon;
  double padleft;
  void Function() onPressed;
  OptionWidget({
    Key? key,
    required this.txt,
    required this.icon,
    required this.padleft,
    required this.onPressed,
  }) : super(key: key);
   

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed:onPressed ,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            elevation: MaterialStateProperty.all(5),
            shadowColor: MaterialStateProperty.all(Colors.grey),
            fixedSize: MaterialStateProperty.all(Size(330, 100)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            )),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 7, top: 10,bottom: 10),
              child: Text(
                txt,
                style: TextStyle(fontSize: 19, color: Colors.black,fontWeight: FontWeight.w300),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: padleft),
              child: Icon(
                icon,
                color: Colors.black,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
