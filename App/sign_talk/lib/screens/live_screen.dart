import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:sign_talk/global/variables.dart';

import '../widgets/svg_button.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  CameraController? _cameraController;
  bool _isExpanded = false;
  static const int _animDuration = 500;
  static const String _svgLocation = "assets/images/vector";

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameraController =
        CameraController(cameras[0], ResolutionPreset.ultraHigh);
    await _cameraController?.initialize();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _cameraController != null && _cameraController!.value.isInitialized
              ? CameraPreview(_cameraController!)
              : Container(
                  color: Colors.black,
                ),
          Column(
            children: [
              _buildBackButton(),
              const Spacer(),
              _buildMovableBottomSheet(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMovableBottomSheet(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          icon: AnimatedRotation(
            alignment: Alignment.center,
            duration: const Duration(milliseconds: _animDuration),
            curve: Curves.easeOut,
            turns: _isExpanded ? -0.5 : 0.0,
            child: const RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: _animDuration),
          curve: Curves.easeOut,
          height: MediaQuery.of(context).size.height / (_isExpanded ? 1.25 : 3),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                height: constraints.maxHeight,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: constraints.maxHeight - 60,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0),
                        child: NotificationListener<
                            OverscrollIndicatorNotification>(
                          onNotification: (overscroll) {
                            overscroll.disallowIndicator();
                            return true;
                          },
                          child: Scrollbar(
                            scrollbarOrientation: ScrollbarOrientation.left,
                            child: ListView(
                              children: const [
                                MessageText(message: 'Hello'),
                                MessageText(message: 'How are you?'),
                                MessageText(message: 'I am fine'),
                                MessageText(message: 'What is your age?'),
                                MessageText(message: 'I am 12 years old'),
                                MessageText(message: 'Hello'),
                                MessageText(message: 'How are you?'),
                                MessageText(message: 'I am fine'),
                                MessageText(message: 'What is your age?'),
                                MessageText(message: 'I am 12 years old'),
                                MessageText(message: 'Hello'),
                                MessageText(message: 'How are you?'),
                                MessageText(message: 'I am fine'),
                                MessageText(message: 'What is your age?'),
                                MessageText(message: 'I am 12 years old'),
                                MessageText(message: 'Hello'),
                                MessageText(message: 'How are you?'),
                                MessageText(message: 'I am fine'),
                                MessageText(message: 'What is your age?'),
                                MessageText(message: 'I am 12 years old'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgButton(
                            imageURL: "$_svgLocation/ionic-ios-browsers.svg",
                            onPressed: () {},
                          ),
                          SvgButton(
                            imageURL: '$_svgLocation/ios-volume-on.svg',
                            onPressed: () {},
                          ),
                          SvgButton(
                            imageURL: '$_svgLocation/feather-share.svg',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBackButton() {
    return Container(
      alignment: Alignment.bottomLeft,
      height: 100,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: SafeArea(
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              //TODO:go back
            },
          ),
        ),
      ),
    );
  }
}

class MessageText extends StatelessWidget {
  final String message;

  const MessageText({
    required this.message,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 22.0, color: Colors.grey),
      ),
    );
  }
}
