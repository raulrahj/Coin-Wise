import 'dart:io';

import 'package:coin_wise/constants/colors.dart';
import 'package:coin_wise/constants/sizes.dart';
import 'package:coin_wise/constants/text_styles.dart';
import 'package:coin_wise/database/profiledata.dart';
import 'package:coin_wise/database/transactions_db.dart';
import 'package:coin_wise/screens/intro_screens/onboarding_screen.dart';
import 'package:coin_wise/screens/intro_screens/splash_screen.dart';
import 'package:coin_wise/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home.dart';
class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // appbar = true;
    return SafeArea(
      child: Padding(
        padding: decent0,
        child: Column(
          children: [
            decentSpace20,
            defaultContainer(
              color: Theme.of(context).primaryColor,

              // color: brightness != Brightness.light
              //     ? defaultPrimaryColor
              //     : defaultColorDark,
              item: ValueListenableBuilder(
                  valueListenable: profileListner,
                  builder: (context, ProfileModel newProfileListener, child) {
                    final ProfileModel _data = newProfileListener;
                    return Container(
                      height: displayHeight(context) * .14,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // addHorizontalSpace(20.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Wrap(
                                      children: const [
                                        Icon(
                                          Icons.person_outlined,
                                          size: 16,
                                        ),
                                        Text(
                                          "Profile",
                                          style: defaultTitle,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                addHorizontalSpace(10.0),
                                Text(
                                  _data.profileName ?? 'Username',
                                  style: boxSubBoldTitle,
                                  // style: brightness != Brightness.light
                                  //     ? boxSubBoldTitle
                                  //     : const TextStyle(color: defaultGreyDark),
                                ),
                              ],
                            ),
                            trailing: _data.profilePhoto == null
                                ? const CircleAvatar(
                                    backgroundColor: primaryGrey,
                                    radius: 30,
                                    child: Icon(
                                      Icons.person,
                                      color: primaryBlack,
                                      size: 40,
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        FileImage(File(_data.profilePhoto!)),
                                  )),
                      ),
                    );
                  }),
            ),
            settingsTile(
              bg: Theme.of(context).primaryColor,

                settingsFunction: () async => showDialog(
                    context: context, builder: (ctx) => ThemePopup()),
                head: "Theme",
                icn: const Icon(Icons.brightness_medium_rounded)),
            settingsTile(
              bg: Theme.of(context).primaryColor,

                head: "Notification",
                icn: const Icon(Icons.notifications_active),
                trail:const SwitchScreen()),
            settingsTile(
              bg: Theme.of(context).primaryColor,

              settingsFunction: () async {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return SimpleDialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        children: [
                          const Text(
                              ' Do you really want to clear all the transactions'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: (() =>
                                      Navigator.of(context).pop()),
                                  child: const Text("Cancel")),
                              TextButton(
                                  onPressed: () {
                                    TransactionDbFunctions.instance
                                        .clearTransaction();
                                  },
                                  child: const Text('Ok'))
                            ],
                          )
                        ],
                      );
                    });
              },
              head: "Restore Data",
              icn: const Icon(Icons.restart_alt_rounded),
            ),
            settingsTile(
              bg: Theme.of(context).primaryColor,

                settingsFunction: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IntroScreen()));
                  isSplash = false;
                },
                head: "App Intro",
                icn: const Icon(Icons.phone_android_rounded)),
            settingsTile(
              bg: Theme.of(context).primaryColor,

                head: "Feedback",
                icn: const Icon(Icons.chat),
                settingsFunction: () async {
                  _launchURLBrowser();
                }),
            settingsTile(
                // settingsFunction: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MyHomePage(),)),
                //  showDialog(
                //     context: context, builder: (ctx) => aboutApp(context)),
              bg: Theme.of(context).primaryColor,
                head: "About app",
                icn: const Icon(Icons.info_outline)),
          ],
        ),
      ),
    );
  }
  Widget settingsTile(
          {required String head,
          Widget? icn,
          Widget? trail,
          Function()? settingsFunction, bg,fg}) =>
      defaultContainer(
        color: bg,
        // ( !dark!) 
        //     ? defaultPrimaryColor
        //     : defaultColorDark,
        item: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onTap: settingsFunction,
          title: Text(
            head,
            style: boxTitle,
          ),
          leading: icn,
          iconColor: fg,
              // brightness != Brightness.light ? Colors.black : defaultGreyDark,
          trailing: trail,
        ),
      );
}

_launchURLBrowser() async {
  const url =
      'https://docs.google.com/forms/d/e/1FAIpQLScgwt_faJ4ahJ0nweK2ZzO7CyE20h1Gs1BOzXM00_j9pNOUdA/viewform?usp=sf_link/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
