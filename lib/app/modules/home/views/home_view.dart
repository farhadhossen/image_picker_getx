import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/home_controller.dart';
import 'dart:io';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Obx(()=>controller.selectedImagePath.value==''?
                  Text('Select immage from camera/gallery',
                  style: TextStyle(fontSize: 20),
                  )
                  : Image.file(File(controller.selectedImagePath.value))
              ),

              SizedBox(height: 10,),
              Obx(()=>Text(controller.selectedImageSize.value==''?'':
              controller.selectedImageSize.value,
              style: TextStyle(fontSize: 20),
              ),
              ),

              RaisedButton(onPressed: (){
                controller.getImage(ImageSource.camera);
              },
                child: Text("Camera"),
              ),
              RaisedButton(onPressed: (){
                controller.getImage(ImageSource.gallery);
              },
              child: Text("Gallery"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
