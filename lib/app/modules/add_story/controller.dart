import 'package:barber_booking/app/data/services/camera_service.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';

class AddStoryController extends GetxController {
  late CameraController cameraController;
  RxBool cameraInitialized = false.obs;

  @override
  void onInit() {
    initializeCamera();
    super.onInit();
  }

  @override
  void onClose() {
    cameraController.dispose();
    super.onClose();
  }

  initializeCamera() async {
    try {
      cameraInitialized(false);
      cameraController = CameraController(
          CustomCameraService.cameras[0], ResolutionPreset.max);
      await cameraController.initialize();
      cameraInitialized(true);
    } catch (e, s) {
      cameraInitialized(false);
      print(e);
      print(s);
    }
  }
}
