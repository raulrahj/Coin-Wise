import 'dart:io';

import 'package:coin_wise/constants/colors.dart';
import 'package:coin_wise/constants/sizes.dart';
import 'package:coin_wise/constants/text_styles.dart';
import 'package:coin_wise/database/category_db.dart';
import 'package:coin_wise/database/profiledata.dart';
import 'package:coin_wise/database/transactions_db.dart';
import 'package:coin_wise/models/transaction_model.dart';
import 'package:coin_wise/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    appbar = true;
    return SafeArea(
      child: Padding(
        padding: decent0,
        child: Column(
          children: [
            decentSpace20,
            Card(
              color: defaultPrimaryColor,
              child:
              ValueListenableBuilder(valueListenable: profileListner, builder: (context, ProfileModel newProfileListener, child){
                final ProfileModel _data =newProfileListener;
                return  Container(
                height: displayHeight(context) * .1,
                child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              "Profile",
                              style: defaultTitle,
                            )
                          ],
                        ),
                        Text(
                          _data.profileName ?? 'Username',
                          style: boxTitle,
                        ),
                        Text(
                          _data.profileEmail ?? 'email@gmail.com',
                        )
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
                            backgroundImage: FileImage(File(_data.profilePhoto!)),
                          )),
              );
              }),
            ),
            settingsTile(
                head: "Theme",
                icn: const Icon(Icons.brightness_medium_rounded)),
            settingsTile(
                head: "Notification",
                icn: const Icon(Icons.notifications_active),
                trail: SwitchScreen()),
            settingsTile(
              settingsFunction: () async {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return SimpleDialog(
                        children: [
                      const Text(
                             ' Do you really want to clear all the transactions'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: (() =>
                                      Navigator.of(context).pop()),
                                  child:const Text("Cancel")),
                              TextButton(
                                  onPressed: () {
                                    TransactionDbFunctions.instance
                                        .clearTransaction();
                                  },
                                  child:const Text('Ok'))
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
                head: "App Intro",
                icn: const Icon(Icons.phone_android_rounded)),
            settingsTile(
                head: "Feedback",
                icn: const Icon(Icons.chat),
                settingsFunction: () async {
                  _launchURLBrowser();
                }),
            settingsTile(
                settingsFunction: () =>
                    CategoryFunctions.instance.categoryAmountAdding(),
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
          Function()? settingsFunction}) =>
      Card(
        color: defaultPrimaryColor,
        child: ListTile(
          onTap: settingsFunction,
          title: Text(
            head,
            style: boxTitle,
          ),
          leading: icn,
          iconColor: Colors.black,
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
