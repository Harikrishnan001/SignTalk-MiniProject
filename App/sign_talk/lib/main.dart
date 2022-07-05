import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sign_talk/screens/dashboardscreen/dashboard_screen.dart';
import '/global/variables.dart';
import '/screens/live_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  cameras = await availableCameras();
  runApp(const SignTalkApplication());
}

class SignTalkApplication extends StatelessWidget {
  const SignTalkApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashBoardScreen(),
    );
  }
}
