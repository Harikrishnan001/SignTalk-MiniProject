import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionWidget extends StatelessWidget {
  String txt;
  IconData icon;
  double padleft;
  OptionWidget({
    Key? key,
    required this.txt,
    required this.icon,
    required this.padleft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          print("tap");
        },
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              elevation: MaterialStateProperty.all(5),
              shadowColor: MaterialStateProperty.all(Colors.grey),
              fixedSize: MaterialStateProperty.all(Size(330, 60)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              )),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 7, top: 20, bottom: 20),
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
      ),
    );
  }
}
