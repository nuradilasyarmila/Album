import 'package:album/api/album_api.dart';
import 'package:album/notifier/desc_notifier.dart';
import 'package:album/screens/details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:provider/provider.dart';
//import 'add_image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    DescNotifier descNotifier =
        Provider.of<DescNotifier>(context, listen: false);
    getDesc(descNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DescNotifier descNotifier = Provider.of<DescNotifier>(context);
    return Scaffold(
        appBar: AppBar(title: Text('Private Album')),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddImage()));
          },
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Image.network(descNotifier.decslist[index].image),
              width: 120,
              fit: BoxFit.fitWidth,
              title: Text(descNotifier.decslist[index].title),
              subtitle: Text(descNotifier.decslist[index].location),
              onTap: () {
                descNotifier.currentDesc = descNotifier.decslist[index];
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context){
                    return PhotoDetail();
                  })
                )
              },
            );
          },
          itemCount: descNotifier.decslist.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Colors.black,
            );
          },
        ));
  }
}
