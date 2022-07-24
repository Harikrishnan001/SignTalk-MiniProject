import 'package:camera/camera.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<CameraDescription> cameras = [];
late SharedPreferences sp;
class STGlobals {
  static bool isDarkMode = false;
  static double fontSize = 22.0;
}
