import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_english_flutter_app/widgets/on_boarding_widget/rounded_button.dart';
import 'package:translator/translator.dart';

import 'drawer_screen.dart';

class TranslateScreen extends StatefulWidget {
  static const String routeName = '/translate_screen';

  //String searchWords = '';
  const TranslateScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  //FlutterLanguageIdentification languageIdentification = FlutterLanguageIdentification();
  final sourceController = TextEditingController();
  final vietnameseController = TextEditingController();
  final translator = GoogleTranslator();
  String source = '';
  String vietnamese = '';
  bool isGottenValueFromMainScreen = false;
  String sourceLanguage = 'English';
  FlutterTts flutterTts = FlutterTts();

  XFile? imageFile;
  bool textScanning = false;

  @override
  void initState() {
    super.initState();
    print("-----------ALREADY INITIALIZED-----------");
    sourceController.addListener(_onTextChange);
    vietnameseController.addListener(_onTextChange);
  }

  @override
  void dispose() {
    sourceController.dispose();
    vietnameseController.dispose();
    super.dispose();
  }

  void _onTextChange() async {
    print("-----------ALREADY SET TEXT CHANGE HANDLE-----------");
    setState(() {
      source = sourceController.text;
    });
    // String lang = await languageIdentification.identifyLanguage(english);
    // print ("LANGUAGE: $lang");
    var result = await translator.translate(source, to: 'vi');

    setState(() {
      sourceLanguage = result.sourceLanguage.toString();
      vietnamese = result.text;
      vietnameseController.value = TextEditingValue(
        text: vietnamese,
        selection: TextSelection.fromPosition(
          TextPosition(offset: vietnamese.length),
        ),
      );
    });
    print("LANGUAGE: ${result.sourceLanguage}");
  }

  @override
  Widget build(BuildContext context) {
    //english = widget.searchWords;
    if (isGottenValueFromMainScreen == false) {
      if (source == '') {
        final translateString =
            ModalRoute.of(context)!.settings.arguments as String;
        source = translateString;
        sourceController.value = TextEditingValue(
          text: source,
          selection: TextSelection.fromPosition(
            TextPosition(offset: source == null ? 0 : source.length),
          ),
        );
      }

      isGottenValueFromMainScreen = true;
    }

    return Scaffold(
      drawer: const DrawerScreen(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.06 - 5,
            left: 10,
            child: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 34,
              ),
              onPressed: () => ZoomDrawer.of(context)!.toggle(),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.06 - 5,
            right: 10,
            child: IconButton(
              icon: const Icon(
                Icons.restart_alt,
                color: Colors.white,
                size: 34,
              ),
              onPressed: () {
                sourceController.text = '';
                vietnameseController.text = '';
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.06,
            child: const Text(
              "Translate",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: 'FredokaOne',
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.16,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: TextFormField(
                    controller: sourceController,
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                    keyboardType: TextInputType.multiline,
                    maxLines: 7,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      labelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'FredokaOne',
                      ),
                      labelText: sourceLanguage,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    icon: const Icon(
                      Icons.volume_up_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      if (sourceController.text != '') {
                        await flutterTts.setLanguage("en-US");
                        await flutterTts.speak(sourceController.text);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: TextFormField(
                    controller: vietnameseController,
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                    keyboardType: TextInputType.multiline,
                    maxLines: 7,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'FredokaOne',
                      ),
                      labelText: 'Vietnamese',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    icon: const Icon(
                      Icons.volume_up_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      if (vietnameseController.text != '') {
                        await flutterTts.setLanguage("vi-VN");
                        await flutterTts.speak(vietnameseController.text);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.85,
            child: RoundedButton(
              backgroundColor: Colors.white,
              text: 'Scan Text',
              textColor: Colors.indigo,
              onPressed: () {
                getImage(ImageSource.camera);
              },
            ),
          ),
        ],
      ),
    );
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
    sourceController.text = "";
    String searchText = "";

    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        sourceController.text =
            (sourceController.text + line.text).trim().toLowerCase();
        break;
      }
    }
    print('${sourceController.text}');
    textScanning = false;
    setState(() {});
  }
}
