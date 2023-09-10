import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  bool _hasPermission = false;
  bool _isSelfieMode = false;

  late final AnimationController _buttonAnimationController =
      AnimationController(
    vsync: this,
    duration: Duration(
      milliseconds: 300,
    ),
  );

  late final AnimationController _progressAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(seconds: 10),
    lowerBound: 0.0,
    upperBound: 1.0,
  );

  late final Animation<double> _buttonAnimation =
      Tween(begin: 1.0, end: 1.3).animate(_buttonAnimationController);

  late final CameraController _cameraController;

  Future<void> _toggleSelfieMode() async {
    _isSelfieMode = !_isSelfieMode;

    await initCamera();
    setState(() {});
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) return;

    _cameraController = CameraController(
        cameras[_isSelfieMode ? 1 : 0], ResolutionPreset.medium,
        imageFormatGroup: ImageFormatGroup.bgra8888);

    await _cameraController.initialize();

    await _cameraController.prepareForVideoRecording();
  }

  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;

    final micDenied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;
    if (!cameraDenied && !micDenied) {
      _hasPermission = true;

      await initCamera();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();

    initPermissions();

    WidgetsBinding.instance.addObserver(this);
  }

  Future<void> _onPickPhotoPressed() async {
    final photo = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (photo == null) return;

    if (!mounted) return;

    Navigator.pop(context, {'filePath': photo.path});

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => VideoPreviewScreen(
    //       video: photo,
    //       isPicked: true,
    //     ),
    //   ),
    // );
  }

  @override
  void dispose() {
    _buttonAnimationController.dispose();
    _progressAnimationController.dispose();
    _cameraController.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  bool _appActivated = true;

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) async {
  //   if (!_hasPermission) return;
  //   if (!_cameraController.value.isInitialized) return;
  //   if (state == AppLifecycleState.inactive ||
  //       state == AppLifecycleState.detached) {
  //     _appActivated = false;
  //     setState(() {});
  //     _cameraController.dispose();
  //   } else if (state == AppLifecycleState.resumed) {
  //     _appActivated = true;
  //     await initCamera();
  //   }
  // }

  Future<void> _takePhoto() async {
    final file = await _cameraController.takePicture();

    Navigator.pop(context, {'filePath': file.path});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: !_hasPermission || !_cameraController.value.isInitialized
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Initializing...",
                    style:
                        TextStyle(color: Colors.white, fontSize: Sizes.size20),
                  ),
                  Gaps.v20,
                  CircularProgressIndicator.adaptive()
                ],
              )
            : Stack(
                children: [
                  if (_appActivated)
                    Positioned.fill(child: CameraPreview(_cameraController)),
                  Positioned(
                    top: Sizes.size32,
                    left: Sizes.size20,
                    child: IconButton(
                      onPressed: _toggleSelfieMode,
                      color: Colors.white,
                      icon: Icon(
                        Icons.cameraswitch,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: Sizes.size40,
                    child: GestureDetector(
                      onTap: _takePhoto,
                      child: ScaleTransition(
                        scale: _buttonAnimation,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: Sizes.size80 + Sizes.size14,
                              height: Sizes.size80 + Sizes.size14,
                              child: CircularProgressIndicator(
                                color: Colors.red.shade400,
                                strokeWidth: Sizes.size6,
                                value: _progressAnimationController.value,
                              ),
                            ),
                            Container(
                              width: Sizes.size80,
                              height: Sizes.size80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red.shade400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    right: 100,
                    child: Container(
                      alignment: Alignment.center,
                      child: IconButton(
                        onPressed: _onPickPhotoPressed,
                        icon: const FaIcon(
                          FontAwesomeIcons.image,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
