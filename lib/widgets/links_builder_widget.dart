import 'package:blog/services/dato_api_client.dart';
import 'package:blog/services/models/my_link.dart';
import 'package:flutter/material.dart';

class LinksBuilderWidget extends StatefulWidget {
  const LinksBuilderWidget({Key? key}) : super(key: key);

  @override
  _LinksBuilderWidgetState createState() => _LinksBuilderWidgetState();
}

class _LinksBuilderWidgetState extends State<LinksBuilderWidget> {
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
