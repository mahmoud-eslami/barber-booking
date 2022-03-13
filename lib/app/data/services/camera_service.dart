import 'package:camera/camera.dart';

class CustomCameraService {
  static List<CameraDescription> cameras = [];

  static initializeCamera() async {
    cameras = await availableCameras();
  }
}
