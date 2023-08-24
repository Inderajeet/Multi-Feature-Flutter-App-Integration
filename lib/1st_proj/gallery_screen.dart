// import 'dart:convert';

// import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;

// class GalleryScreen extends StatefulWidget {
//   const GalleryScreen({super.key});

//   @override
//   State<GalleryScreen> createState() => _GalleryScreenState();
// }e

// class _GalleryScreenState extends State<GalleryScreen> {
//   List<dynamic> data = [];
//   Future<void> fetchApi() async {
//     var url = "https://jsonplaceholder.typicode.com/albums";
//     var response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       var jsonData = jsonDecode(response.body);
//       setState(() {
//         data = jsonData;
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchApi();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // return ListView.builder(
//     //   itemCount: data.length,
//     //   itemBuilder: (context, index) {
//     //     final album = data[index];
//     //     return ListTile(
//     //       title: Text('Id: ${album["id"]} Title: ${album["title"]}'),
//     //     );
//     //   },
//     // );
//     return GridView.count(
//       crossAxisCount: 2,
//       mainAxisSpacing: 10,
//       crossAxisSpacing: 10,
//       padding: EdgeInsets.all(10),
//       children: List.generate(data.length, (index) {
//         final album = data[index];
//         return Container(
//           decoration: BoxDecoration(
//             border: Border.all(width: 2.5, color: Colors.green),
//           ),
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               // child: Text('Id: ${album["id"]} Title: ${album["title"]}'),
//               // child: Image.asset('assets/salary_account.jpg'),

//               child: Image.network('https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg?w=740&t=st=1691690033~exp=1691690633~hmac=7793d5539d07689324cc2fc3867c3935dd353fe95d6b62814da74e4cd977b68e'),
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }

// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';

// class GalleryScreen extends StatefulWidget {
//   const GalleryScreen({super.key});

//   @override
//   State<GalleryScreen> createState() => _GalleryScreenState();
// }

// class _GalleryScreenState extends State<GalleryScreen> {
//   var data = [];
//   Future<void> fetchApi() async {
//     var url = "https://source.unsplash.com/collection/1163637/480x480";
//     var response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       var jsonData = jsonDecode(response.body);
//       setState(() {
//         data = jsonData;
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchApi();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       crossAxisCount: 2,
//       mainAxisSpacing: 7,
//       crossAxisSpacing: 7,
//       children: List.generate(data.length, (index) {
//         return Container(
//           child: Image.network(
//             data[index],
//           ),
//         );
//       }),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List data = [];
  List imagesUrl = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  Future<String> fetchDataFromApi() async {
    var url = "https://s3-us-west-2.amazonaws.com/appsdeveloperblog.com/tutorials/files/cats.json";
    // var url = "https://source.unsplash.com/collection/1163637/480x480";
    var jsonData = await http.get(Uri.parse(url));
    var fetchData = jsonDecode(jsonData.body);

    setState(() {
      data = fetchData;
      data.forEach((element) {
        imagesUrl.add(element['url']);
      });
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: imagesUrl.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            imagesUrl[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  } 
}
