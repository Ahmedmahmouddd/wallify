import 'package:flutter/material.dart';
import 'package:wallify/Models/photo_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wallify/search/full_screen.dart';

class SearchedImages extends StatelessWidget {
  const SearchedImages({
    super.key,
    required this.photos,
  });

  final List<PhotoModel> photos;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: photos.map((PhotoModel photomodel) {
            return GridTile(
                child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FullScreen(imagePath: photomodel.src!.portrait!);
                }));
              },
              child: Hero(
                  tag: photomodel.src!.portrait!,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                          placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(color: Colors.blue[700], strokeWidth: 8)),
                          imageUrl: photomodel.src!.portrait!,
                          fit: BoxFit.cover))),
            ));
          }).toList(),
        ),
      ),
    );
  }
}
