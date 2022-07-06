import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sign_talk/screens/live_screen.dart';
import '../../global/colors.dart';
import 'option.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  Future<void> pickTextFile() async {
    var result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt'],
    );
  }

  Future<void> pickImages() async {
    var result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg'],
    );
    print('THE PATH IS ${result!.files[0].path}');
    
  }

  @override
  Widget build(BuildContext context) {
    void camScreen() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LiveScreen()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
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
                        style: TextStyle(color: STFontColor.primaryColor))
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
                child: ClipOval(
                    child: Image.asset('assets/images/raster/new.jpg')),
                backgroundColor: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset('assets/images/raster/Vector.png'),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: OptionWidget(
                    txt: "Live",
                    icon: Icons.video_camera_front,
                    padleft: 205,
                    onPressed: camScreen,
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 3,
                  child: OptionWidget(
                    txt: "From Gallery",
                    icon: Icons.folder_copy,
                    padleft: 130,
                    onPressed: pickImages,
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 3,
                  child: OptionWidget(
                    txt: "Saved Files",
                    icon: Icons.file_copy,
                    padleft: 140,
                    onPressed: pickTextFile,
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 3,
                  child: OptionWidget(
                    txt: "Analytics",
                    icon: Icons.bar_chart_sharp,
                    padleft: 160,
                    onPressed: () {},
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 3,
                  child: OptionWidget(
                    txt: "Learn",
                    icon: Icons.cast_for_education_outlined,
                    padleft: 190,
                    onPressed: () {},
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _buildBody(BuildContext context, void camScreen()) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Spacer(),
          Image.asset('assets/images/raster/Vector.png'),
          Column(children: [
            Expanded(
              child: OptionWidget(
                txt: "Live",
                icon: Icons.video_camera_front,
                padleft: 205,
                onPressed: camScreen,
              ),
            ),
            Expanded(
              child: OptionWidget(
                txt: "From Gallery",
                icon: Icons.folder_copy,
                padleft: 130,
                onPressed: pickImages,
              ),
            ),
            Expanded(
              child: OptionWidget(
                txt: "Saved Files",
                icon: Icons.file_copy,
                padleft: 140,
                onPressed: pickTextFile,
              ),
            ),
            Expanded(
              child: OptionWidget(
                txt: "Analytics",
                icon: Icons.bar_chart_sharp,
                padleft: 160,
                onPressed: () {},
              ),
            ),
            Expanded(
              child: OptionWidget(
                txt: "Learn",
                icon: Icons.cast_for_education_outlined,
                padleft: 190,
                onPressed: () {},
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
