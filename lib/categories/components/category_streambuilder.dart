import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryStreamBuilder extends StatelessWidget {
  const CategoryStreamBuilder({
    super.key,
    required this.categoryStream,
  });

  final Stream? categoryStream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: categoryStream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: snapshot.data.docs.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
                return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      fit: BoxFit.cover,
                      documentSnapshot['image'],
                    ));
              },
            );
          } else {
            return Center(child: CircularProgressIndicator(color: Colors.blue[700], strokeWidth: 8));
          }
        });
  }
}
