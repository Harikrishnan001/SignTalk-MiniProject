import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgButton extends StatelessWidget {
  final String imageURL;
  final VoidCallback onPressed;
  final Color? overlayColor;
  final String? semanticsLabel;
  final double size;

  const SvgButton({
    required this.imageURL,
    required this.onPressed,
    this.overlayColor,
    this.semanticsLabel,
    this.size = 50,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const CircleBorder()),
          overlayColor: MaterialStateProperty.all(overlayColor),
        ),
        onPressed: () {},
        child: SvgPicture.asset(
          imageURL,
          semanticsLabel: semanticsLabel,
        ),
      ),
    );
  }
}
