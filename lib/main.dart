import 'package:flutter/material.dart';
import 'package:packingtracker/splashscreen.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:const MySplashScreen(),
      theme: ThemeData(
        primaryColor: Colors.black,
        primarySwatch: Colors.grey,
      ),
    );
  }
}

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// void main() =>runApp(PictureShowcaseApp());
         
// class PictureShowcaseApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: PictureShowcaseHome("My Best Pictures"),
//       title: "My Best Pictures"
//     );
//   }
// }

// class PictureShowcaseHome extends StatefulWidget {
//   final String title;

//   PictureShowcaseHome(this.title);
  
//   _HomePageState createState() => _HomePageState();

// }
          
          
// class _HomePageState extends State<PictureShowcaseHome> {
//   List<Image> imgs = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.title)),
//       body: ListView.builder(
//         itemCount: imgs.length,
//         itemBuilder: (context, i) =>
//           Column(
//             children: [
//               imgs[i],
//               Divider()
//             ]
//           ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () async {
//           var imgFile = await ImagePicker().pickImage(
//             source: ImageSource.camera
//           );
//           File _image = File(imgFile!.path);
//           setState((){
//             imgs.add(Image.file(_image));
//           });
//         }
//       ),
//     );
//   }
// }