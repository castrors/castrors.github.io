import 'package:blog/services/dato_api_client.dart';
import 'package:blog/services/models/my_link.dart';
import 'package:flutter/material.dart';

class BlogLinksBuilder extends StatefulWidget {
  const BlogLinksBuilder({Key? key}) : super(key: key);

  @override
  _BlogLinksBuilderState createState() => _BlogLinksBuilderState();
}

class _BlogLinksBuilderState extends State<BlogLinksBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: DatoApiClient.fetchLinks(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          MyLink link = snapshot.data!.first as MyLink;
          return Text(link.title);
        } else if (snapshot.hasError) {
          return Text('error');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
