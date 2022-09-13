import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key, required this.cameras}) : super(key: key);
  final List<CameraDescription> cameras;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;
  XFile? imagem;

  @override
  void initState() {
    super.initState();

    controller = CameraController(
      widget.cameras[0],
      ResolutionPreset.max,
      imageFormatGroup: ImageFormatGroup.yuv420,
      enableAudio: false,
    );

    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Foto'),
        backgroundColor: Colors.grey[900],
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          imagem == null
              ? Column(
                  children: [
                    Container(
                      color: Colors.grey[900],
                      child: Center(
                        child: CameraPreview(controller),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          imagem = await controller.takePicture();

                          if (mounted) {
                            setState(() {});
                          }
                        },
                        child: const Text('Pronto'),
                      ),
                    ),
                  ],
                )
              : Image.file(
                  File(imagem!.path),
                ),
        ],
      ),
    );
  }
}
