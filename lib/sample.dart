// // import 'package:flutter/material.dart';

// // class ListItem {
// //   String title;
// //   String description;

// //   ListItem({required this.title, required this.description});
// // }

// // class EditableListView extends StatefulWidget {
// //   @override
// //   _EditableListViewState createState() => _EditableListViewState();
// // }

// // class _EditableListViewState extends State<EditableListView> {
// //   List<ListItem> _items = [
// //     ListItem(title: 'Item 1', description: 'Description 1'),
// //     ListItem(title: 'Item 2', description: 'Description 2'),
// //     // Add more items as needed
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(title: Text('Editable List')),
// //         body: ListView.builder(
// //           itemCount: _items.length,
// //           itemBuilder: (context, index) {
// //             return ListTile(
// //               title: TextFormField(
// //                 initialValue: _items[index].title,
// //                 onChanged: (value) {
// //                   setState(() {
// //                     _items[index].title = value;
// //                   });
// //                 },
// //               ),
// //               subtitle: TextFormField(
// //                 initialValue: _items[index].description,
// //                 onChanged: (value) {
// //                   setState(() {
// //                     _items[index].description = value;
// //                   });
// //                 },
// //               ),
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp2());
// }

// class MyApp2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _selectedIndex = 0;
//   final List<Widget> navScreens = [
//     Home(),
//     Explore(),
//     Favorites(),
//     Profile(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   AppBar _buildAppBar() {
//     switch (_selectedIndex) {
//       case 0:
//         return AppBar(title: Text('Home'));
//       case 1:
//         return AppBar(title: Text('Explore'));
//       case 2:
//         return AppBar(title: Text('Favorites'));
//       case 3:
//         return AppBar(title: Text('Profile'));
//       default:
//         return AppBar(title: Text('My App'));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:
//           _buildAppBar(), // Dynamically changing AppBar based on selectedIndex
//       // body: Center(
//       //   child: Text('Content of Screen ${_selectedIndex + 1}'),
//       // ),
//     body: navScreens[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         // backgroundColor: Colors.green,
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//             backgroundColor: Colors.red,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.explore),
//             label: 'Explore',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Favorites',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }


// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Home'),);
//   }
// }

// class Explore extends StatelessWidget {
//   const Explore({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Explore'),
//     );
//   }
// }
// class Favorites extends StatelessWidget {
//   const Favorites({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Favorites'),
//     );
//   }
// }

// class Profile extends StatelessWidget {
//   const Profile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Profile'),
//     );
//   }
// }

