import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi App de Cámara'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 5),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.camera_alt,
                  size: 80,
                  color: Colors.black,
                ),
                onPressed: () {
                  _abrirCamara(context);
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Tómate una foto para probar las prendas',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _abrirCamara(context);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.black,
              ),
              child: Text('Tomar Foto'),
            ),
          ],
        ),
      ),
    );
  }

  void _abrirCamara(BuildContext context) async {
    final cameras = await availableCameras();
    final camera = cameras.first;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraScreen(camera: camera),
      ),
    );
  }
}

class CameraScreen extends StatefulWidget {
  final CameraDescription camera;

  const CameraScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Cámara'),
      ),
      body: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: CameraPreview(_controller),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tomar foto
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}
