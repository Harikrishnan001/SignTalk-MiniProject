import 'package:flutter/material.dart';
import '/screens/dashboard_screen.dart';

void main() {
  runApp(const SignTalkApplication());
}

class SignTalkApplication extends StatelessWidget {
  const SignTalkApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DashBoardScreen(),
    );
  }
}
