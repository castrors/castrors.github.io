import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 14,
  }) : super(key: key);

  final String text;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.ubuntu(
        textStyle: Theme.of(context).textTheme.bodyMedium,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
