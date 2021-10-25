import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'analyze_page.dart';

class AuthViaCameraPage extends StatefulWidget {
  const AuthViaCameraPage({Key? key}) : super(key: key);

  @override
  _AuthViaCameraPageState createState() => _AuthViaCameraPageState();
}

class _AuthViaCameraPageState extends State<AuthViaCameraPage> {
  @override
  Widget build(BuildContext context) {
    return CameraCamera(
      onFile: (file) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => AnalyzePage()));
      },
    );
  }
}
