import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class CommunicationFormView extends StatefulWidget {
  final String appBarTitle;
  const CommunicationFormView({super.key, required this.appBarTitle});

  @override
  // ignore: library_private_types_in_public_api
  _CommunicationFormViewState createState() => _CommunicationFormViewState();
}

class _CommunicationFormViewState extends State<CommunicationFormView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController topicController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool? showErrorText;
  List<File> selectedImages = [];
  bool showMaxImagesWarning = false;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
    topicController.addListener(() {
      setState(() {});
    });
    descriptionController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    topicController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    // ignore: unnecessary_nullable_for_final_variable_declarations
    final List<XFile>? pickedImages = await _picker.pickMultiImage();
    if (pickedImages != null) {
      setState(() {
        for (var pickedImage in pickedImages) {
          if (selectedImages.length < 3) {
            selectedImages.add(File(pickedImage.path));
          }
        }
        // Show the max image warning if more than 3 images are selected
        if (selectedImages.length >= 3) {
          _showMaxImagesWarning();
        }
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      selectedImages.removeAt(index);
    });
  }

  void _showMaxImagesWarning() {
    setState(() {
      showMaxImagesWarning = true;
    });

    // Hide the warning after 5 seconds
    Timer(const Duration(seconds: 5), () {
      setState(() {
        showMaxImagesWarning = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.appBarTitle,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "E-Posta*",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: TextField(
                  controller: emailController,
                  cursorColor: const Color(0xFF185fb9),
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    suffixIcon: emailController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(
                              Icons.close_rounded,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              emailController.clear();
                            },
                          )
                        : null,
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.grey)),
                    hintText: "E-Postanızı giriniz",
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 13),
              const Text(
                "Konu*",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: TextField(
                  controller: topicController,
                  cursorColor: const Color(0xFF185fb9),
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: topicController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(
                              Icons.close_rounded,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              topicController.clear();
                            },
                          )
                        : null,
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.grey)),
                    hintText: "örn. Dolar yatırımlarım",
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 13),
              const Text(
                "Açıklama*",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: TextField(
                  controller: descriptionController,
                  maxLines: 2,
                  cursorColor: const Color(0xFF185fb9),
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: descriptionController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(
                              Icons.close_rounded,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              descriptionController.clear();
                            },
                          )
                        : null,
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.grey)),
                    hintText:
                        "Bu formdan, geri bildirimlerinizi iletebilirsiniz!",
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              selectedImages.isEmpty
                  ? GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        child: const Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.paperclip,
                              color: Colors.white,
                            ),
                            SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Fotoğraf ekle(1 MB)",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  ".jpeg, .png, .webp uzantılı dosyalar",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        Row(
                          children: [
                            for (int i = 0; i < selectedImages.length; i++)
                              Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    height: 100,
                                    width: 100,
                                    child: Image.file(
                                      selectedImages[i],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: IconButton(
                                      icon: Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: const Center(
                                            child: FaIcon(
                                              FontAwesomeIcons.xmark,
                                              color: Colors.white,
                                            ),
                                          )),
                                      onPressed: () => _removeImage(i),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                        if (showMaxImagesWarning)
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Maksimum 3 resim seçebilirsiniz!',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 14),
                            ),
                          ),
                      ],
                    ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(13),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xFF1a202c),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    "Gönder",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
