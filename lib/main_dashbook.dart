import 'package:flutter/material.dart';

import 'package:dashbook/dashbook.dart';

import 'components/components.dart';

void main() {
  final dashbook = Dashbook();

  dashbook.storiesOf('Blog Title').decorator(CenterDecorator()).add(
        'default',
        (ctx) => BlogTitle(
          text: ctx.textProperty("text", "Title"),
        ),
      );
  dashbook.storiesOf('Blog Subtitle').decorator(CenterDecorator()).add(
        'default',
        (ctx) => BlogSubtitle(
          text: ctx.textProperty("text", "Subtitle"),
        ),
      );

  dashbook.storiesOf('Blog Description').decorator(CenterDecorator()).add(
        'default',
        (ctx) => BlogDescription(
          text: ctx.textProperty("text", "Description"),
        ),
      );
  dashbook.storiesOf('Blog Header').decorator(CenterDecorator()).add(
        'default',
        (ctx) => const BlogHeader(),
      );

  runApp(dashbook);
}
