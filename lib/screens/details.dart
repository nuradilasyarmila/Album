import 'package:album/notifier/desc_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhotoDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DescNotifier descNotifier =
        Provider.of<DescNotifier>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(descNotifier.currentDecs.title),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Image.network(descNotifier.currentDecs.image)
              SizedBox(
                height: 32,
              ),
              Text(descNotifier.currentDecs.title,
                style: TextStyle(fontSize: 40,
                ),
              ),
              Text(descNotifier.currentDecs.location,
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
              Text(descNotifier.currentDecs.createdAt,
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ],
          ),
        ),
      ),
    );
  }
}
