import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  List<CameraDescription> cameras = [];
  CameraController? controller;
  XFile? imagem;
  Size? size;

  @override
  void initState() {
    super.initState();
    _loadCameras();
  }

  _loadCameras() async {
    try {
      cameras = await availableCameras();
      _startCamera();
    } on CameraException catch (e) {
      print(e.description);
    }
  }

  _startCamera() {
    if (cameras.isEmpty) {
      print('Camera não foi encontrada');
    } else {
      _previewCamera(cameras.first);
    }
  }

  _previewCamera(CameraDescription camera) async {
    final CameraController cameraController = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );
    controller = cameraController;
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      print(e.description);
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Foto'),
        backgroundColor: Colors.grey[900],
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[900],
        child: Center(
          child: _foto(),
        ),
      ),
      floatingActionButton: (imagem != null)
          ? FloatingActionButton.extended(
              onPressed: () => Navigator.pop(context),
              label: const Text("Finalizar"),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _foto() {
    return Container(
      width: size!.width - 50,
      height: size!.height - (size!.height / 3),
    );
  }
}
