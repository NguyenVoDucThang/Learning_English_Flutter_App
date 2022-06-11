import 'dart:io';
import 'dart:typed_data';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_english_flutter_app/widgets/dictionary_widget/search_background.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:image_cropper/image_cropper.dart';

import 'custom_square_button.dart';

class SearchWordTff extends StatefulWidget {
  final TextEditingController inputController;
  final VoidCallback func;
  final VoidCallback openDrawer;

  const SearchWordTff({
    Key? key,
    required this.inputController,
    required this.func,
    required this.openDrawer,
  }) : super(key: key);

  @override
  State<SearchWordTff> createState() => _SearchWordTffState();
}

class _SearchWordTffState extends State<SearchWordTff> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  double _confidence = 1.0;
  XFile? imageFile;
  bool textScanning = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBackground(
      openDrawer: widget.openDrawer,
      listButton: Row(
        children: [
          CustomSquareButton(
            icon: Icons.mic_rounded,
            title: "microphone",
            func: () {
              createAlertDialog(context);
              _listen();
            },
          ),
          const SizedBox(width: 15),
          CustomSquareButton(
            icon: Icons.camera_alt_outlined,
            title: "camera",
            func: () {
              getImage(ImageSource.camera);
            },
          ),
          const SizedBox(width: 15),
          CustomSquareButton(
            icon: Icons.aspect_ratio_outlined,
            title: "gallery",
            func: () {
              getImage(ImageSource.gallery);
            },
          ),
        ],
      ),
      searchWidget: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.9,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: widget.inputController,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(181, 181, 181, 1.0),
                      fontFamily: 'FredokaOne',
                      fontWeight: FontWeight.w100,
                    ),
                    hintText: 'Search here',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                onPressed: widget.func,
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  createAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: AvatarGlow(
            animate: _isListening,
            glowColor: Theme.of(context).primaryColor,
            endRadius: 75.0,
            duration: const Duration(milliseconds: 2000),
            repeatPauseDuration: const Duration(milliseconds: 100),
            repeat: true,
            child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(224, 62, 62, 1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.mic_none_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() => _isListening = false);
                    _speech.stop();
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            widget.inputController.text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    }
  }

  void getImage(ImageSource source) async {
    print("FILE LINK: " + source.toString());
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      final croppedFile = await ImageCropper.platform.cropImage(
        sourcePath: pickedImage!.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepPurple,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Crop Image',
          ),
        ],
      );
      XFile image = XFile(croppedFile!.path);
      if (image != null) {
        textScanning = true;
        imageFile = image;
        setState(() {});
        getRecognisedText(image);
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      setState(() {});
    }
  }

  void getRecognisedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognisedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    widget.inputController.text = "";
    String searchText = "";

    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        widget.inputController.text =
            (widget.inputController.text + line.text).trim().toLowerCase();
        break;
      }
    }
    print('${widget.inputController.text}');
    textScanning = false;
    setState(() {});
  }
}
