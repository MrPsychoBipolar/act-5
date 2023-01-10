import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _chosenBotNavBarIndex = 0;
  File? file;
  int likeCounter = 1;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imgTemporary = File(image.path);
      setState(() {
        this.file = imgTemporary;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text(
          'Camera and Gallery Permissions',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            left: deviceWidth(context) * 0.130,
            width: 300,
            height: 70,
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.only(top: 12, left: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.blueAccent,
              ),
              child: const Text(
                'Facebook Post Simulator',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                ),
              ),
            ),
          ),
          Positioned(
            top: deviceHeight(context) * 0.125,
            left: deviceWidth(context) * 0.01,
            height: 500,
            width: 400,
            child: Container(
              padding: const EdgeInsets.only(top: 85),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Color.fromRGBO(82, 81, 81, 1.0),
              ),
              child: Container(
                margin: const EdgeInsets.only(
                    top: 15, bottom: 150, left: 10, right: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.grey,
                ),
                child: file == null
                    ? const Icon(
                        Icons.image,
                        size: 25,
                      )
                    : Image.file(
                        file!,
                        fit: BoxFit.fill,
                      ),
              ),
            ),
          ),
          Positioned(
            top: deviceHeight(context) * 0.14,
            left: deviceWidth(context) * 0.03,
            height: 80,
            width: deviceWidth(context) * 0.2,
            child: CircleAvatar(
              child: file == null
                  ? const Icon(
                      Icons.image,
                      size: 50,
                    )
                  : Image.file(file!, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: deviceHeight(context) * 0.15,
            left: deviceWidth(context) * 0.24,
            height: 100,
            child: const Text(
              'Imuha daw ning Pangalan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(218, 218, 218, 1.0),
              ),
            ),
          ),
          Positioned(
            top: deviceHeight(context) * 0.19,
            left: deviceWidth(context) * 0.24,
            height: 100,
            child: const Text(
              'mura mag Just Now',
              style: TextStyle(
                fontSize: 17,
                color: Color.fromRGBO(218, 218, 218, 1.0),
              ),
            ),
          ),
          Positioned(
            top: deviceHeight(context) * 0.136,
            left: deviceWidth(context) * 0.62,
            height: 100,
            child: const Icon(
              Icons.settings,
              color: Color.fromRGBO(218, 218, 218, 1.0),
            ),
          ),
          Positioned(
            top: deviceHeight(context) * 0.091,
            left: deviceWidth(context) * 0.87,
            height: 100,
            child: const Icon(
              Icons.more_horiz_rounded,
              size: 40,
              color: Color.fromRGBO(218, 218, 218, 1.0),
            ),
          ),
          Positioned(
              height: 30,
              width: deviceWidth(context) * 0.2,
              top: 450,
              left: 29,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(82, 81, 81, 1.0),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/loveReact.png',
                    ),
                  ),
                ),
              )),
          Positioned(
              height: 30,
              width: deviceWidth(context) * 0.2,
              top: 450,
              left: 5,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(82, 81, 81, 1.0),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/wowReact.png',
                    ),
                  ),
                ),
              )),
          Positioned(
            height: 30,
            width: deviceWidth(context) * 0.5,
            top: 455,
            left: 95,
            child: Text(
              'Nanli and $likeCounter others',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Positioned(
            height: 45,
            width: deviceWidth(context) * 0.5,
            top: 540,
            left: 95,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  likeCounter++;
                });
              },
              child: const Text('click this button to make 1 person like this post', style: TextStyle()),
            ),
          ),
          Positioned(
            height: 30,
            width: deviceWidth(context) * 0.9,
            top: 470,
            left: 20,
            child: const Divider(
                color: Color.fromRGBO(218, 218, 218, 1.0), thickness: 2),
          ),
          Positioned(
            height: 30,
            width: deviceWidth(context) * 0.9,
            top: 490,
            left: 8,
            child: Row(
              children: const [
                SizedBox(
                  width: 35,
                ),
                Icon(
                  Icons.thumb_up_alt_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Like',
                  style: TextStyle(
                      color: Color.fromRGBO(218, 218, 218, 1.0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Positioned(
            height: 30,
            width: deviceWidth(context) * 0.9,
            top: 490,
            left: 109,
            child: Row(
              children: const [
                SizedBox(
                  width: 35,
                ),
                Icon(
                  Icons.comment_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Comment',
                  style: TextStyle(
                      color: Color.fromRGBO(218, 218, 218, 1.0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Positioned(
            height: 30,
            width: deviceWidth(context) * 0.9,
            top: 490,
            left: 255,
            child: Row(
              children: const [
                SizedBox(
                  width: 35,
                ),
                Icon(
                  Icons.share_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Share',
                  style: TextStyle(
                      color: Color.fromRGBO(218, 218, 218, 1.0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Positioned(
            height: 30,
            width: deviceWidth(context) * 0.9,
            top: 510,
            left: 20,
            child: const Divider(
                color: Color.fromRGBO(218, 218, 218, 1.0), thickness: 2),
          ),
          // Positioned(
          //   height: 30,
          //   width: deviceWidth(context) * 0.43,
          //   top: 550,
          //   left: 25,
          //   child: MaterialButton(
          //     onPressed: () {
          //       getCam();
          //     },
          //     color: Colors.blue[800],
          //     child: const Text('Add Photo Via Camera', style: TextStyle(fontWeight: FontWeight.bold),),
          //   ),
          // ),
          // Positioned(
          //   height: 30,
          //   width: deviceWidth(context) * 0.42,
          //   top: 550,
          //   left: 210,
          //   child: MaterialButton(
          //     onPressed: () {
          //       getGallery();
          //     },
          //     color: Colors.blue[800],
          //     child: const Text('Add Photo Via Gallery',style: TextStyle(fontWeight: FontWeight.bold),),
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Camera',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Gallery'),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        onTap: (int index) async {
          if (index == _chosenBotNavBarIndex) {
            PermissionStatus cameraStatus = await Permission.camera.request();
            if (cameraStatus == PermissionStatus.granted) {
              pickImage(ImageSource.camera);
            } else if (cameraStatus == PermissionStatus.denied) {
              return;
            }
          } else {
            PermissionStatus galleryStatus = await Permission.storage.request();
            if (galleryStatus == PermissionStatus.granted) {
              pickImage(ImageSource.gallery);
            } else if (galleryStatus == PermissionStatus.denied) {
              return;
            }
          }
        },
      ),
    );
  }
}
