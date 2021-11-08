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

              Obx(()=>controller.compressImagePath.value==''?
                  Text('Select immage from camera/gallery',
                  style: TextStyle(fontSize: 20),
                  )
                  : Image.file(File(controller.compressImagePath.value))
              ),

              SizedBox(height: 10,),
              Obx(()=>Text(controller.compressImagePath.value==''?'':
              controller.compressImageSIze.value,
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
