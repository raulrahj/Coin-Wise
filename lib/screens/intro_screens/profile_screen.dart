import 'dart:io';
import 'package:coin_wise/constants/colors.dart';
import 'package:coin_wise/constants/sizes.dart';
import 'package:coin_wise/constants/text_styles.dart';
import 'package:coin_wise/database/profiledata.dart';
import 'package:coin_wise/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../main_screens/home.dart';

class SetupProfile extends StatelessWidget {
  SetupProfile({Key? key}) : super(key: key);
  final _profileName = TextEditingController();
  final _profileEmail = TextEditingController();
  ImagePicker imagePicker = ImagePicker();

  var image;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: defaultGradient,
      ),
      width: MediaQuery.of(context).size.height,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: defaultColor,
                    // gradient: defaultBoxGradient,
                    borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(50),
                        bottomStart: Radius.circular(50))),
                width: double.infinity,
                height: displayHeight(context) * .22,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: all8,
                      child: Text(
                        "Setup Profile",
                        style: forBold,
                      ),
                    ),
                  ],
                ),
              ),
              decentSpace,
              defaultContainer(
                height: displayHeight(context) * .38,
                item: Form(
                  key: _formKey,
                  child: ValueListenableBuilder(
                      valueListenable: profileListner,
                      builder:
                          (context, ProfileModel newProfileListner, child) {
                        final ProfileModel _data = newProfileListner;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, bottom: 1),
                              child: GestureDetector(
                                onTap: () async {
                                  // _data.profilePhoto=await image.toString();
                                  profileListner.value.profilePhoto = null;
                                  await showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('Open'),
                                          content: SingleChildScrollView(
                                            child: ListBody(children: [
                                              GestureDetector(
                                                child: Row(
                                                  children: const [
                                                    Icon(Icons.camera),
                                                    Text('Camera'),
                                                  ],
                                                ),
                                                onTap: () async {
                                                  
                                                  XFile? img = await imagePicker
                                                      .pickImage(
                                                          source: ImageSource
                                                              .camera);
                                                  image = File(img!.path);
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              const Padding(
                                                  padding: EdgeInsets.all(10)),
                                              GestureDetector(
                                                child: Row(
                                                  children: const [
                                                    Icon(Icons.image),
                                                    Text('Gallery'),
                                                  ],
                                                ),
                                                onTap: () async {
                                                  XFile? img = await imagePicker
                                                      .pickImage(
                                                          source: ImageSource
                                                              .gallery);
                                                  image = File(img!.path);
                                                  Navigator.of(context).pop();
                                                },
                                              )
                                            ]),
                                          ),
                                        );
                                      });
                                },
                                child: _data.profilePhoto == null
                                    ? const CircleAvatar(
                                        maxRadius: 48,
                                        minRadius: 39,
                                        backgroundColor: primaryGrey,
                                        child: Icon(
                                          Icons.person,
                                          size: 60,
                                          color: primaryBlack,
                                        ),
                                      )
                                    : CircleAvatar(
                                        maxRadius: 48,
                                        minRadius: 39,
                                        backgroundImage: FileImage(
                                            File(_data.profilePhoto.toString()),
                                            scale: 1),
                                      ),
                              ),
                            ),
                            TextFormBox(
                              hint: 'Name',
                              profileformController: _profileName,
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'please enter the name !';
                                }
                                if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                  return 'try to use alphabets !';
                                }
                                if (value.length < 4) {
                                  return 'enter a valid name !';
                                }
                                return null;
                              },
                            ),
                            TextFormBox(
                              hint: 'Email',
                              profileformController: _profileEmail,
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter the email !';
                                }
                              },
                            ),
                          ],
                        );
                      }),
                ),
              ),
              blockSpace,
              SizedBox(
                height: 38,
                child: defaultButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      bool isLogged = true;
                      final name = _profileName.text;
                      final email = _profileEmail.text;
                      final profilePhoto = image.path??null;
                      ProfileModel _profileData = ProfileModel(
                          profileName: name,
                          profileEmail: email,
                          profilePhoto: profilePhoto,
                          isLogged: isLogged);
                      ProflieDb().addprofileData(_profileData);
                      // bool check = checkLoggedIn as bool;
                      if (isLogged) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (BuildContext ctx) {
                          return const Navigate();
                        }), (route) => false);
                      }
                    }
                  },
                  text: 'Start',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void addprofileData() {
    if (_profileName == null) {
      return;
    }
    if (_profileEmail == null) {
      return;
    }
    // if(image==null){
    //   return;
    // }
  }
}

void getStarted(context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (ctx) => const Navigator()));
}