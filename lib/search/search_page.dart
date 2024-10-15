import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wallify/Models/photo_model.dart';
import 'package:http/http.dart' as http;
import 'package:wallify/home/components/custom_appbar.dart';
import 'package:wallify/search/components/search_field.dart';
import 'package:wallify/search/components/searched_images_grid.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<PhotoModel> photos = [];
  TextEditingController searchController = TextEditingController();
  bool search = false;
  getSearchWallpapers(String searchQuery) async {
    photos = [];
    await http.get(
      Uri.parse("https://api.pexels.com/v1/search?query=$searchQuery&per_page=1000"),
      headers: {"Authorization": "7lpN28eBM1Xe2ASCXJID0vdC4XUIpnJC36gsEwlcz5chhqswtzd1ahuC"},
    ).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        PhotoModel model = PhotoModel();
        model = PhotoModel.fromJson(element);
        photos.add(model);
      });
      setState(() {
        search = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const CustomAppbar(title: "Search"),
      body: Column(
        children: [
          SearchField(
            searchBool: search,
            searchController: searchController,
            onSearchTap: () => getSearchWallpapers(searchController.text),
            onSubmitted: (value) => getSearchWallpapers(value),
            onCloseTap: () => setState(() {
              // photos = [];
              search = false;
              searchController.clear();
            }),
          ),
          SearchedImages(photos: photos)
        ],
      ),
    );
  }
}
