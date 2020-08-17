import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:quick_learn/utils/firebase_helper.dart';

class StorageHelper {
  static FirebaseStorage firebaseStorage;

  firebaseStorageOpen() async {
//    print((await FirebaseHelper.checkFirebaseToken()).token);
    final ref = firebaseStorage.ref().child('/');
    final opt = await firebaseStorage.app.options;
//    await firebaseStorage.storageBucket
    final video1 = await firebaseStorage.ref().child('/video1.mp4');

    print(await video1);
    print((await video1.getMetadata()).metadataGeneration);

    print(await ref.getBucket());
    print(await ref.path);
  }

  Future<String> firebaseStorageGetUrl(path) async {
    final ref = firebaseStorage.ref().child(path);
    final url = await ref.getDownloadURL();
    return url;
  }
}
