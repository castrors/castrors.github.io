import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidget extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const TitleWidget({required this.text, this.color = Colors.black});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.ubuntu(
        textStyle: Theme.of(context).textTheme.headline4,
        color: Colors.black,
      ),
    );
  }
}
