// ignore_for_file: avoid_print
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class FullScreen extends StatefulWidget {
  final String imagePath;
  const FullScreen({super.key, required this.imagePath});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  saveImage() async {
    try {
      var response = await Dio().get(widget.imagePath, options: Options(responseType: ResponseType.bytes));
      var status = await Permission.storage.request();
      // if (status.isGranted) {
      final result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));

      if (result['isSuccess']) {
        print("Image saved successfully: ${result['filePath']}");
      } else {
        print("Failed to save image");
      }
      // } else {
      //   print("permission denied");
      // }
    } catch (e) {
      print("Error while saving image: $e");
    } finally {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
              tag: widget.imagePath,
              child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: widget.imagePath,
                    fit: BoxFit.cover,
                  ))),
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        saveImage();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 4),
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(50)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
                          child: Text("Save to gallery",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'p',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
