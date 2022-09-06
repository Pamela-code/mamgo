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
  Size? size;

  @override
  void initState() {
    super.initState();

    controller = CameraController(
      widget.cameras[0],
      ResolutionPreset.max,
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

  // _loadCameras() async {
  //   try {
  //     cameras = await availableCameras();
  //     _startCamera();
  //   } on CameraException catch (e) {
  //     print('print 1 ${e.description}');
  //   }
  // }

  // _startCamera() {
  //   if (cameras.isEmpty) {
  //     print('Camera não foi encontrada');
  //   } else {
  //     _previewCamera(cameras.first);
  //   }
  // }

  // _previewCamera(CameraDescription camera) async {
  //   final CameraController cameraController = CameraController(
  //     camera,
  //     ResolutionPreset.medium,
  //     enableAudio: false,
  //     imageFormatGroup: ImageFormatGroup.jpeg,
  //   );
  //   controller = cameraController;
  //   try {
  //     await cameraController.initialize();
  //   } on CameraException catch (e) {
  //     print('print 2 ${e.description}');
  //   }
  //   if (mounted) {
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
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
          child: CameraPreview(controller),
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

  // _foto() {
  //   return Container(
  //     width: size!.width - 50,
  //     height: size!.height - (size!.height / 3),
  //     child: imagem == null
  //         ? _cameraPreviewWidget()
  //         : Image.file(
  //             File(imagem!.path),
  //             fit: BoxFit.contain,
  //           ),
  //   );
  // }

  // _cameraPreviewWidget() {
  //   final CameraController? cameraController = controller;

  //   if (cameraController == null || cameraController.value.isInitialized) {
  //     return const Center(
  //       child: Text(
  //         'Camera não disponível',
  //         style: TextStyle(
  //           color: Colors.white,
  //         ),
  //       ),
  //     );
  //   } else {
  //     return Stack(
  //       alignment: AlignmentDirectional.bottomCenter,
  //       children: [
  //         CameraPreview(controller!),
  //         _botaoCaptura(),
  //       ],
  //     );
  //   }
  // }

  // _botaoCaptura() {
  //   return Padding(
  //     padding: EdgeInsets.only(bottom: 24),
  //     child: CircleAvatar(
  //       radius: 32,
  //       backgroundColor: Colors.green,
  //       child: IconButton(
  //         icon: Icon(Icons.camera_alt),
  //         onPressed: tirarFoto,
  //       ),
  //     ),
  //   );
  // }

  // tirarFoto() async {
  //   final CameraController? cameraController = controller;
  //   if (cameraController != null && cameraController.value.isInitialized) {
  //     try {
  //       XFile file = await cameraController.takePicture();
  //       if (mounted) {
  //         setState(() => imagem = file);
  //       }
  //     } on CameraException catch (e) {
  //       print(e.description);
  //     }
  //   }
  // }
}
