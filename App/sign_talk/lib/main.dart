import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_talk/screens/login_screen.dart';
import '/screens/dashboardscreen/dashboard_screen.dart';
import '/global/variables.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  cameras = await availableCameras();
  sp=await SharedPreferences.getInstance();
  runApp(const SignTalkApplication());
}

class SignTalkApplication extends StatelessWidget {
  const SignTalkApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scrollbarTheme: ScrollbarThemeData(
          thumbVisibility: MaterialStateProperty.all(true),
          radius: const Radius.circular(3.0),
          thickness: MaterialStateProperty.all(6.0),
        ),
      ),
      home:DashBoardScreen(),
      // home: DashBoardScreen(),
    );
  }
}
