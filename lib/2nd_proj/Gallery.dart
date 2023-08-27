import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  List<dynamic> data = [];
  List<dynamic> img_data = [];
  List<String> images = [];
  Future<void> fetchImages() async {
    // url
    // header
    final url = "https://jsonplaceholder.typicode.com/albums";
    final img_url =
        "https://s3-us-west-2.amazonaws.com/appsdeveloperblog.com/tutorials/files/cats.json";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      setState(() {
        data = jsonData;
      });
    }
    var img_response = await http.get(Uri.parse(img_url));
    if (img_response.statusCode == 200) {
      var img_jsonData = jsonDecode(img_response.body);
      setState(() {
        img_data = img_jsonData;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return
        // ListView.separated(
        //   separatorBuilder: (context, index) {
        //     return Divider(
        //       height: 2,
        //       color: const Color.fromARGB(255, 73, 64, 36),
        //       indent: 17,
        //       endIndent: 20,
        //       thickness: .5,
        //     );
        //   },
        //   itemCount: data.length,
        //   itemBuilder: (context, index) {
        //     final album = data[index];
        //     return ListTile(
        //       title: Text('Id: ${album["id"]}, Title: ${album["title"]}'),
        //     );
        //   },
        // );
        GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: img_data.length,
            itemBuilder: (context, index) {
              final img_url = img_data[index];
              return Container(
                child: Image.network(
                  img_url['url'],
                  fit: BoxFit.cover,
                ),
              );
            });

    // return GridView.builder(
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 2,
    //       crossAxisSpacing: 10,
    //       mainAxisSpacing: 10,
    //     ),
    //     itemCount: data.length,
    //     itemBuilder: (context, index) {
    //       final album = data[index];
    //       return Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Container(
    //           height: 400,
    //           width: 400,
    //           decoration: BoxDecoration(
    //             border: Border.all(
    //               color: Color.fromARGB(255, 120, 209, 60),
    //               width: 0.5,
    //             ),
    //             borderRadius: BorderRadius.circular(10),
    //           ),
    //           child: Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Text('Id: ${album["id"]}, Title: ${album["title"]}'),
    //           ),
    //         ),
    //       );
    //     });
  }
}
