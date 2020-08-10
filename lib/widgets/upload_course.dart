import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

var storage = FirebaseStorage.instance;

class UploadCourse extends StatefulWidget {
  @override
  _UploadCourseState createState() => _UploadCourseState();
}

class _UploadCourseState extends State<UploadCourse> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

//  firebaseSetup() async {
//    final FirebaseOptions options = const FirebaseOptions();
//    final FirebaseApp firebase = await FirebaseApp.configure(
//      name: 'quickLearn-01',
//      options: options,
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text('test upload'),
        onPressed: () async {
          Directory tempdir = await getTemporaryDirectory();
          final targetPath = tempdir.path + '/test.txt';
          final sampleFile = File(targetPath);
          await sampleFile.writeAsString('hello Firebase');
//          storage.ref().

          final snapshot = await storage
              .ref()
              .child('/sample/text.txt')
              .putFile(sampleFile)
              .onComplete;
          if (snapshot.error == null) {
            final snackBar = SnackBar(content: Text('Yay! Success'));
            Scaffold.of(context).showSnackBar(snackBar);
          } else {
            final snackBar = SnackBar(
                content: Text('Upload Failed ' + snapshot.error.toString()));
            Scaffold.of(context).showSnackBar(snackBar);
          }
        },
      ),
    );
  }
}
