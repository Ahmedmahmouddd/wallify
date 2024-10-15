import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  Future addWallpaper(Map<String, dynamic> wallpaperInfoMap, String id, category) async {
    return await FirebaseFirestore.instance.collection(category).doc(id).set(wallpaperInfoMap);
  }

  Future<Stream<QuerySnapshot>> getCategory(String name) async {
    return FirebaseFirestore.instance.collection(name).snapshots();
  }
}
