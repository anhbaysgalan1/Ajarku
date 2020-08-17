import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quick_learn/models/hive/user/user.dart';
import 'package:quick_learn/screens/RootApp.dart';
import 'package:quick_learn/utils/firebase_helper.dart';
import 'package:quick_learn/utils/storage_helper.dart';

main() async {
//  Hive
  await Hive.initFlutter();
  Hive.registerAdapter<UserProfile>(UserProfileAdapter());
  await Hive.openBox<UserProfile>('userProfile');
  await Hive.openLazyBox('authBox');

  //Firebase
  final FirebaseApp firebaseApp = await FirebaseApp.configure(
    name: 'quickLearn-01',
    options: FirebaseOptions(
      // Option obtained from google-service.json and from firebase settings.
      apiKey: 'AIzaSyDTrj7e8EThUqR3lksJ-xywWkKHD4iUBYE',
      googleAppID: '1:382773275457:android:7929462b019c547578cfc0',
      projectID: 'quicklearn-01',
    ),
  );
  FirebaseHelper.firebaseAuth = FirebaseAuth.fromApp(firebaseApp);
  StorageHelper.firebaseStorage = FirebaseStorage(
    app: firebaseApp,
    storageBucket: 'gs://quicklearn-01.appspot.com',
  );
  runApp(RootApp());
}
