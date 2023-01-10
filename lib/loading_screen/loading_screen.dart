import 'package:camera_gallery_permissions_app/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double _deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  double _deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  @override
  void initState() {
    super.initState();
    _navigateToLoginPage();
  }

  _navigateToLoginPage() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Dashboard()));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Center(
          child: CircleAvatar(
            radius: 100,
            child: Image(image: AssetImage('assets/nanli.jpg'),),
          ),
        ),
      ],
    );
  }
}