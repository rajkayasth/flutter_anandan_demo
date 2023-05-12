import 'dart:io';

import 'package:anandan_demo_flutter/ui_helper/custom_colors.dart';
import 'package:anandan_demo_flutter/ui_helper/utils.dart';
import 'package:anandan_demo_flutter/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as Path;

class SelectImageScreen extends StatefulWidget {
  const SelectImageScreen({Key? key}) : super(key: key);

  @override
  State<SelectImageScreen> createState() => _SelectImageScreenState();
}

class _SelectImageScreenState extends State<SelectImageScreen> {
  File? image;

  ///Creating Method for picking Image from Gallery
  Future PickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      debugPrint(image.path);
      final imagePermanant = await saveImagePermanetly(image.path);
      setState(() => this.image = imagePermanant);
    } on PlatformException catch (e) {
      debugPrint('Failed to Pick image $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTap: () {},
        title: "Pick Image",
        leadingIconTap: () {},
      ),
      backgroundColor: Colors.yellow,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              image != null
                  ? ClipOval(
                      child: Image.file(
                        image!,
                        width: 150,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                    )
                  : ClipOval(
                      child: Image.asset(
                        "assets/images/anadan_logo.png",
                        width: 170,
                        height: 170,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Pick Image",
                style: titleTextStyle20(
                    textColor: CustomColor.darkBlue,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              customButton(
                icon: Icons.camera,
                text: "Pick Image from Camera",
                onTap: () {
                  PickImage(ImageSource.camera);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              customButton(
                icon: Icons.image,
                text: "Pick Image from Gallery",
                onTap: () {
                  PickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<File> saveImagePermanetly(String path) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = Path.basename(path);
    final image = File("${directory.path}/$name");

    return File(path).copy(image.path);
  }
}

Widget customButton({
  required IconData icon,
  required String text,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: CustomColor.darkGray, width: 1)),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: titleTextStyle16(
                textColor: Colors.black, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    ),
  );
}
