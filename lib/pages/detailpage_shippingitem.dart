import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/imageuploadedmodel.dart';

class DetailShippingPage extends StatelessWidget {
  const DetailShippingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Order: #001234',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: ShippingDetailList(),
              ),
              Positioned(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                  child: const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      "SAVE",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                bottom: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShippingDetailList extends StatefulWidget {
  ShippingDetailList({Key? key}) : super(key: key);

  @override
  State<ShippingDetailList> createState() => _ShippingDetailListState();
}

class _ShippingDetailListState extends State<ShippingDetailList> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  late Future<String> _value;

  File? _image;
  final picker = ImagePicker();

  Map<int, File?> files = {0: null, 1: null, 2: null, 3: null};

  Future<File> _getLocalFile(String filename) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    File f = File('$dir/$filename');
    return f;
  }

 
  // File? imageFile;

  bool _isVisible = false;
  List<File> imgs = [];
  List<Image> img = [];
  List<String> imgarray = [];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(
        thickness: 2,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            shipvalues[index].name,
                            style: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            shipvalues[index].category,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.camera_alt),
                    onPressed: () {
                      _getImage(index);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              //const ListViewForCamera(),
              Visibility(
                visible: _isVisible,
                child: Stack(
                  children: [
                    _image == null
                        ? Image.asset("assets/lola1.jpg")
                        : _selectedindex == index
                            ? Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.file(
                                    _image!,
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )
                            : const Visibility(visible: false, child: Text("")),
                    //: const Visibility(visible: false, child: Text("")),
                    const Positioned(
                      child: Icon(Icons.close),
                      top: 0,
                      right: 0,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
      itemCount: shipvalues.length,
      shrinkWrap: true,
      padding: const EdgeInsets.all(5),
      scrollDirection: Axis.vertical,
    );
  }

  int _selectedindex = 0;

  _getImage(int index) async {
//ImageSource: camera
    final imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
    //PickedFile? imageFile = await picker.pickImage(source: ImageSource.camera);
//If there is no image selected, return.
    if (imageFile == null) return;
//File created.
    File tmpFile = File(imageFile.path);
//it gives path to a directory - path_provider package.
    final appDir = await getApplicationDocumentsDirectory();
//filename - returns last part after the separator - path package.
    final fileName = basename(imageFile.path);
//copy the file to the specified directory and return File instance.
    tmpFile = await tmpFile.copy('${appDir.path}/$fileName');
//prints file location
    print('File path is :${tmpFile.path}');
    imgarray.add(tmpFile.path);
    print(imgarray);
    
    

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('$index', tmpFile.path);

    setState(() {
      _image = tmpFile;
      _selectedindex = index;
      _isVisible = true;
    });
  }
}
