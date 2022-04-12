import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewPeople extends StatefulWidget {
  const AddNewPeople({Key? key}) : super(key: key);

  @override
  State<AddNewPeople> createState() => _AddNewPeopleState();
}

class _AddNewPeopleState extends State<AddNewPeople> {
  // File? image;

  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if(image == null) return;
  //     final imageTemp = File(image.path);
  //     setState(() {
  //       this.image = imageTemp;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New People'),
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff050A30), Color(0xff381AB0)],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        )),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            child: Column(
              children: [
                _newNameField(),
                _newEmailField(),
                _newContactNumberField(),
                _relationField(),
                _nextField(),
                // _imageFromGallery(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _newNameField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Column(
        children: [
          TextFormField(
            style: const TextStyle(
              fontSize: 18.0,
              color: Color(0xffe5dcf2),
            ),
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffe5dcf2)),
                ),
                hintText: "Name",
                hintStyle: TextStyle(
                  color: Color(0xffe5dcf2),
                ),
                prefixIcon: Icon(
                  Icons.mail,
                  color: Color(0xffe5dcf2),
                )),
          ),
        ],
      ),
    );
  }

  _newEmailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Column(
        children: [
          TextFormField(
            style: const TextStyle(
              fontSize: 18.0,
              color: Color(0xffe5dcf2),
            ),
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffe5dcf2)),
                ),
                hintText: "Email",
                hintStyle: TextStyle(
                  color: Color(0xffe5dcf2),
                ),
                prefixIcon: Icon(
                  Icons.mail,
                  color: Color(0xffe5dcf2),
                )),
          ),
        ],
      ),
    );
  }

  _newContactNumberField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Column(
        children: [
          TextFormField(
            style: const TextStyle(
              fontSize: 18.0,
              color: Color(0xffe5dcf2),
            ),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffe5dcf2)),
                ),
                hintText: "Contact Number",
                hintStyle: TextStyle(
                  color: Color(0xffe5dcf2),
                ),
                prefixIcon: Icon(
                  Icons.mail,
                  color: Color(0xffe5dcf2),
                )),
          ),
        ],
      ),
    );
  }

  _relationField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Column(
        children: [
          TextFormField(
            style: const TextStyle(
              fontSize: 18.0,
              color: Color(0xffe5dcf2),
            ),
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffe5dcf2)),
                ),
                hintText: "Relation",
                hintStyle: TextStyle(
                  color: Color(0xffe5dcf2),
                ),
                prefixIcon: Icon(
                  Icons.mail,
                  color: Color(0xffe5dcf2),
                )),
          ),
        ],
      ),
    );
  }

  _nextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Column(
        children: [
          TextFormField(
            style: const TextStyle(
              fontSize: 18.0,
              color: Color(0xffe5dcf2),
            ),
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffe5dcf2)),
                ),
                hintText: "Relation",
                hintStyle: TextStyle(
                  color: Color(0xffe5dcf2),
                ),
                prefixIcon: Icon(
                  Icons.mail,
                  color: Color(0xffe5dcf2),
                )),
          ),
        ],
      ),
    );
  }
}
