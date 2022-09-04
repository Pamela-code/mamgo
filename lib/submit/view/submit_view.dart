import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mamgo/submit/controller/submit_controller.dart';
import 'package:mamgo/submit/view/camera_view.dart';
import 'package:mamgo/theme/widgets/button_manngo.dart';

class SubmitView extends StatefulWidget {
  const SubmitView({Key? key}) : super(key: key);

  @override
  State<SubmitView> createState() => _SubmitViewState();
}

class _SubmitViewState extends State<SubmitView> {
  SubmitController controller = SubmitController();

  @override
  void initState() {
    controller.getPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Envio do questionário',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text('Sua localização:'),
            Observer(builder: (_) {
              return Text(
                  'Latitude: ${controller.latitude} Longitude: ${controller.longitude}');
            }),
            const Text('Nos envie uma foto da planta:'),
            InkWell(
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text('Clique aqui'),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CameraPage(),
                    fullscreenDialog: true,
                  ),
                );
              },
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ButtonManngo(label: 'Enviar dados', onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
