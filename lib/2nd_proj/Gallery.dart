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
  Future<void> fetchImages() async {
    // url
    // header
    final url = "https://jsonplaceholder.typicode.com/albums";
    // final url = "https://s3-us-west-2.amazonaws.com/appsdeveloperblog.com/tutorials/files/cats.json";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      setState(() {
        data = jsonData;
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
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(
          height: 2,
          color: const Color.fromARGB(255, 73, 64, 36),
          indent: 17,endIndent: 20,thickness: .5,
        );
      },
      itemCount: data.length,
      itemBuilder: (context, index) {
        final album = data[index];
        return ListTile(
          title: Text('Id: ${album["id"]}, Title: ${album["title"]}'),
        );
      },
    );
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
