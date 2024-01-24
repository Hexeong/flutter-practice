import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

class Upload extends StatefulWidget {
  const Upload({super.key, this.addData, this.moveHome});

  final addData;
  final moveHome;

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {

  var writer = TextEditingController();
  var content = TextEditingController();

  var img = Image.asset("assets/blank_photo.png", width: double.infinity, height: 300,);
  var imgFile;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          img,
          ElevatedButton(
              onPressed: () async {
                var picker = ImagePicker();
                var image = await picker.pickImage(source: ImageSource.gallery);
                setState(() {
                  img = Image.file(File(image!.path), height: 300, width: double.infinity,);
                  imgFile = File(image.path);
                });
              },
              child: Text("Select Photo")),
          TextField(controller: writer, decoration: InputDecoration(hintText: "Enter the posting writer"),),
          TextField(controller: content, decoration: InputDecoration(hintText: "Enter the posting content"),),
          IconButton(
              onPressed: () {
                widget.addData(imgFile, writer.text, content.text);
                widget.moveHome();
              },
              icon: Icon(Icons.add_photo_alternate_outlined, semanticLabel: "Post!",))
        ],
      ),
    );
  }
}
