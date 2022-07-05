import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:sign_talk/global/variables.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  CameraController? _cameraController;
  bool _isExpanded = false;
  static const int _animDuration = 500;

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
