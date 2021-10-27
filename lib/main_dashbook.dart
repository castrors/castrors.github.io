import 'package:blog/widgets/widgets.dart';
import 'package:dashbook/dashbook.dart';
import 'package:flutter/material.dart';

void main() {
  final dashbook = Dashbook();

  dashbook.storiesOf('Blog Title').decorator(CenterDecorator()).add(
        'default',
        (ctx) => TitleWidget(
          text: ctx.textProperty("text", "Title"),
        ),
      );
  dashbook.storiesOf('Blog Subtitle').decorator(CenterDecorator()).add(
        'default',
        (ctx) => SubtitleWidget(
          text: ctx.textProperty("text", "Subtitle"),
        ),
      );

  dashbook.storiesOf('Blog Description').decorator(CenterDecorator()).add(
        'default',
        (ctx) => DescriptionWidget(
          text: ctx.textProperty("text", "Description"),
        ),
      );
  dashbook.storiesOf('Blog Header').decorator(CenterDecorator()).add(
        'default',
        (ctx) => const HeaderWidget(),
      );

  runApp(dashbook);
}
