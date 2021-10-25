import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogSubtitle extends StatelessWidget {
  const BlogSubtitle({Key? key, required this.text, this.color = Colors.black})
      : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.ubuntu(
          textStyle: Theme.of(context).textTheme.headline6,
          color: color),
    );
  }
}
