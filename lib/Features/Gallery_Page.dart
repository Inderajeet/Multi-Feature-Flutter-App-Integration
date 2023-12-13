import 'package:flutter/material.dart';
import 'package:test_project/Features/PhotoView.dart';

class ImageGridScreen extends StatelessWidget {

  List<String> imageUrls = [
    'https://picsum.photos/id/1001/4912/3264',
    'https://img.freepik.com/free-photo/butterfly-wild_53876-90200.jpg?w=740&t=st=1693301287~exp=1693301887~hmac=61539f932ef872b4358d5826027e9b99c02dc2820f1edad944d907c1f993ede3',
  ];
  // ImageGridScreen(this.imageUrls);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // You can adjust the number of columns as needed
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageDetailScreen(imageUrls, index),
                ),
              );
            },
            child: Container(
              child: Image.network(
                imageUrls[index],
                fit: BoxFit.contain,
                
              ),
            ),
          );
        },
      ),
    );
  }
}
