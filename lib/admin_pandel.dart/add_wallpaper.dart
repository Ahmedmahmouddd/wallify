import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:wallify/admin_pandel.dart/components/admin_appbar.dart';
import 'package:wallify/admin_pandel.dart/components/admin_login_button.dart';
import 'package:wallify/methods/database_methods.dart';

class AddWallpaper extends StatefulWidget {
  const AddWallpaper({super.key});

  @override
  State<AddWallpaper> createState() => _AddWallpaperState();
}

class _AddWallpaperState extends State<AddWallpaper> {
  final List<String> categoryItems = ["Wild life", "Food", "City", "Nature", "Anime", "Cars"];
  String? value;
  final ImagePicker picker = ImagePicker();
  File? selectedImage;

  Future getImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  uploadImage() async {
    if (selectedImage != null) {
      String addID = randomAlphaNumeric(10);
      Reference firebaseStorageRef = FirebaseStorage.instance.ref().child("blogImages").child(addID);
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
      var downloadURL = await (await task).ref.getDownloadURL();

      Map<String, dynamic> addItem = {"image": downloadURL, "ID": addID};
      await DataBaseMethods().addWallpaper(addItem, addID, value).then((value) {
        Fluttertoast.showToast(
          msg: "Wallpaper has been added successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.black,
          fontSize: 16,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const AdminAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          selectedImage == null
              ? GestureDetector(
                  onTap: () => getImage(),
                  child: Center(
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[200],
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )
              : Center(
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                    child: Container(
                      width: 300,
                      height: 450,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(selectedImage!, fit: BoxFit.cover)),
                    ),
                  ),
                ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[500],
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
                  child: DropdownButton<String>(
                    borderRadius: BorderRadius.circular(16),
                    dropdownColor: Colors.grey[700],
                    items: categoryItems
                        .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontFamily: 'p',
                                  fontWeight: FontWeight.w600),
                            )))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        this.value = value;
                      });
                    },
                    hint:
                        const Text("Select Category", style: TextStyle(color: Colors.white, fontFamily: 'p')),
                    value: value,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16),
            child: AdminLoginButton(
              onTap: () {
                uploadImage();
              },
              text: 'Add wallpaper',
            ),
          ),
        ],
      ),
    );
  }
}
