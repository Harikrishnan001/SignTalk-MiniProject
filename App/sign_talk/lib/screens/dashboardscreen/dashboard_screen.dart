import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'option.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
            padding: const EdgeInsets.only(top: 20,left: 20),
            child: RichText(
              text: TextSpan(
                  text: 'Sign',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                  children: [
                    TextSpan(
                        text: 'Talk',
                        style:
                            TextStyle(color: Color.fromARGB(255, 89, 197, 93)))
                  ]),
            )),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                print("Naveen");
              },
              child: CircleAvatar(
                child: ClipOval(child: Image.asset('assets/images/new.jpg')),
                backgroundColor: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 40,
                right: 40,
                left: 50,
                bottom: 10,
              ),
              child: Image.asset('assets/images/Vector.png'),
            ),
            OptionWidget(
              txt: "Live",
              icon: Icons.video_camera_front,
              padleft: 205,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: OptionWidget(
                txt: "From Gallery",
                icon: Icons.folder_copy,
                padleft: 130,
              ),
            ),
            OptionWidget(
                txt: "Saved Files", icon: Icons.file_copy, padleft: 140),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: OptionWidget(
                  txt: "Analytics", icon: Icons.bar_chart_sharp, padleft: 160),
            ),
            OptionWidget(
                txt: "Learn",
                icon: Icons.cast_for_education_outlined,
                padleft: 190)
          ],
        ),
      ),
    );
  }
}
