import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:coin_wise/constants/sizes.dart';
import 'package:coin_wise/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:coin_wise/constants/colors.dart';
import 'package:coin_wise/widgets/bottom_nav.dart';
import 'package:coin_wise/database/profiledata.dart';
import 'package:coin_wise/constants/text_styles.dart';

class SetupProfile extends StatefulWidget {
  SetupProfile({Key? key}) : super(key: key);

  @override
  State<SetupProfile> createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> {
  final _profileName = TextEditingController();

  final _profileEmail = TextEditingController();

  ImagePicker imagePicker = ImagePicker();

  dynamic image;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print('Reabuilding');
    Widget? imge;
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
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 15,
                    sigmaY: 15,
                  ),
                  child: defaultContainer(
                    color: defaultPrimaryColor,
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
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 1),
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
                                                      children: [
                                                        const Icon(
                                                            Icons.camera),
                                                        Text(
                                                          '  Camera',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .titleLarge,
                                                        ),
                                                      ],
                                                    ),
                                                    onTap: () async {
                                                      XFile? img =
                                                          await imagePicker
                                                              .pickImage(
                                                                  source:
                                                                      ImageSource
                                                                          .camera)
                                                              .whenComplete(() {
                                                        setState(() {});
                                                      });
                                                      if (img != null) {
                                                        image = File(img.path);
                                                      }

                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  const Padding(
                                                      padding:
                                                          EdgeInsets.all(10)),
                                                  GestureDetector(
                                                      child: Row(
                                                        children: [
                                                          const Icon(
                                                              Icons.image),
                                                          Text('  Gallery',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleLarge),
                                                        ],
                                                      ),
                                                      onTap: () async {
                                                        XFile? img = await imagePicker
                                                            .pickImage(
                                                                source:
                                                                    ImageSource
                                                                        .gallery)
                                                            .whenComplete(() {
                                                          setState(() {print('builded')});
                                                        });
                                                        if (img != null) {
                                                          image =
                                                              File(img.path);
                                                        }

                                                        Navigator.of(context)
                                                            .pop();
                                                      })
                                                ]),
                                              ),
                                            );
                                          });
                                    },
                                    child: _data.profilePhoto == null
                                        ? const CircleAvatar(
                                            maxRadius: 70,
                                            minRadius: 50,
                                            backgroundColor: primaryGreyDark,
                                            child: Icon(
                                              Icons.person,
                                              size: 70,
                                              color: primaryBlack,
                                            ),
                                          )
                                        : CircleAvatar(
                                            maxRadius: 70,
                                            minRadius: 50,
                                            backgroundImage: FileImage(
                                                File(_data.profilePhoto
                                                    .toString()),
                                                scale: 1),
                                            child: CircleAvatar(
                                              backgroundImage:const ExactAssetImage(
                                                  './assets/images/log.jpg'),
                                              child:
                                                  (_data.profilePhoto != null)
                                                      ? Image(width: 70,
                                                      height: 70,
                                                          image: FileImage(File(
                                                              _data.profilePhoto
                                                                  .toString())))
                                                      : Text(''),
                                            ),
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
                                    if (!RegExp(r'^[a-z A-Z]+$')
                                        .hasMatch(value)) {
                                      return 'try to use alphabets !';
                                    }
                                    if (value.length < 4) {
                                      return 'enter a valid name !';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            );
                          }),
                    ),
                  ),
                ),
              ),
              blockSpace,
              defaultButton(
                onPressed: () async {
                  var profilePhoto;
                  if (image != null) {
                    profilePhoto = image.path;
                  }

                  if (_formKey.currentState!.validate()) {
                    bool isLogged = true;
                    final name = _profileName.text;

                    ProfileModel _profileData = ProfileModel(
                        profileName: name,
                        notify: true,
                        profilePhoto: profilePhoto,
                        isLogged: isLogged);
                    ProflieDb().addprofileData(_profileData);
                    // bool check = checkLoggedIn as bool;
                    if (isLogged) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (BuildContext ctx) {
                        return const HomePage();
                      }), (route) => false);
                    }
                  }
                },
                text: 'Start',
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }

  void addprofileData() {
    // if (_profileName == null) {
    //   return;
    // }

    // if(image==null){
    //   return;
    // }
    if (_profileName == null) {
      return;
    }
  }
}

void getStarted(context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (ctx) => const Navigator()));
}
