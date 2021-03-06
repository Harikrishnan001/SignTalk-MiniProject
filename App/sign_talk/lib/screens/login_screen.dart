import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_talk/widgets/svg_button.dart';

import '../global/colors.dart';
import '../global/variables.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _imageURL, tempname = 'hello';
  bool _editMode = false;
  late SharedPreferences nameofuser;
  late TextEditingController _usernameController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usernameController = TextEditingController(text: _getString());
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  Future<void> _setString(String name) async {
    await sp.setString("namevalue", name);
    setState(() {});
  }

  String? _getString() {
    return sp.getString("namevalue");
  }

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg'],
    );
    if (result != null) {
      setState(() {
        _imageURL = result.files[0].path;
      });
    }
  }

  Future<void> _onEditPressed() async {
    if (_editMode) {
      _editMode = false;
      await sp.setString("namevalue", _usernameController.text);
    } else {
      _editMode = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 248, 248, 248),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.navigate_before, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Text(
            "My Profile",
            style: TextStyle(color: Colors.black),
          ),
        ),
       // actions: [IconButton(onPressed: (){}, icon: Icon(Icons.))],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 200,
                width: 200,
                child: Stack(children: [
                  CircleAvatar(
                    // backgroundColor: Colors.white10,
                    radius: 100,
                    backgroundImage: _imageURL != null
                        ? FileImage(File(_imageURL!)) as ImageProvider
                        : AssetImage('assets/images/raster/Vector.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 120, left: 150),
                    child: IconButton(
                      onPressed: () {
                        _pickImage();
                      },
                      icon: CircleAvatar(
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _editMode
                      ? SizedBox(
                          width: 200,
                          child: TextField(
                            controller: _usernameController,
                          ),
                        )
                      : Text(
                          _getString() ?? "Name",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                  IconButton(
                      onPressed: _onEditPressed,
                      icon: _editMode
                          ? const Icon(Icons.save)
                          : const Icon(Icons.edit)),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text('Assignments Completed'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 105),
                  child: Text('2/4'),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: 0.5),
                duration: Duration(seconds: 4),
                builder: (context, double value, _) => Container(
                  height: 20,
                  width: 300,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      value: value,
                      color: STFontColor.primaryColor,
                      backgroundColor: Color.fromARGB(255, 218, 218, 218),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text('Total Signs Learned'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 120),
                  child: Text('25/50'),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: 0.5),
                duration: Duration(seconds: 4),
                builder: (context, double value, _) => Container(
                  height: 20,
                  width: 300,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      value: value,
                      color: STFontColor.primaryColor,
                      backgroundColor: Color.fromARGB(255, 218, 218, 218),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TweenAnimationBuilder(
                      tween: Tween(begin: 0.0, end: 0.75),
                      duration: Duration(seconds: 4),
                      builder: (context, double value, _) => Stack(alignment: Alignment.center,
                        children:[ SizedBox(
                          height: 120,
                          width: 120,
                          child: CircularProgressIndicator(
                            value: value,
                            color: STFontColor.primaryColor,
                            backgroundColor: Color.fromARGB(255, 218, 218, 218),
                            strokeWidth: 20,
                          ),
                        ),Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('75%'),
                        )],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Text(
                      'Learning\n Progress',
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*SafeArea _buildBody(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Stack(children: [
              Center(
                child: CircleAvatar(
                  // backgroundColor: Colors.white10,
                  radius: 80,
                  backgroundImage: _imageURL != null
                      ? FileImage(File(_imageURL!)) as ImageProvider
                      : AssetImage('assets/images/raster/Vector.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120, left: 230),
                child: IconButton(
                  onPressed: () {
                    _pickImage();
                  },
                  icon: CircleAvatar(
                    child: Icon(
                      Icons.camera_alt,
                    ),
                  ),
                ),
              )
            ]),
          ),
          Center(
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: textOrTF
                      ? Text(
                          _getString() ?? '',
                          style: TextStyle(color: Colors.black),
                        )
                      : TextField(
                          controller: username,
                        ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _setString(username.text);
                  },
                  child: textOrTF
                      ? Icon(
                          Icons.edit,
                          size: 20,
                        )
                      : Icon(Icons.save),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
  */
}
