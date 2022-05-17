import 'dart:io';
import 'package:coin_wise/core/constants/colors.dart';
import 'package:coin_wise/core/constants/sizes.dart';
import 'package:coin_wise/screens/main_screens/settings/widgets/about_app.dart';
import 'package:coin_wise/screens/main_screens/settings/widgets/theme_popup.dart';
import 'package:coin_wise/widgets/default_container.dart';
import 'package:coin_wise/widgets/switch_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:launch_review/launch_review.dart';
import 'package:coin_wise/database/profiledata.dart';
import 'package:coin_wise/database/transactions_db.dart';
import 'package:coin_wise/screens/intro_screens/splash_screen.dart';
import 'package:coin_wise/screens/intro_screens/onboarding_screen.dart';

class Settings extends StatelessWidget {
  TextStyle? title;
  Color? shadowcolor;
  Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    title = Theme.of(context).textTheme.titleLarge;
    shadowcolor = Theme.of(context).iconTheme.color;
    // appbar = true;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: decent0,
          child: Column(
            children: [
              addHorizontalSpace(7.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: defaultContainer(
                  color: Theme.of(context).primaryColor,
                  item: ValueListenableBuilder(
                      valueListenable: profileListner,
                      builder: (context, ProfileModel newProfileListener, child) {
                        final ProfileModel _data = newProfileListener;
                        return Container(
                          height: displayHeight(context) * .14,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 5),
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
                                          children:  [
                                          const  Icon(
                                              Icons.person_outlined,
                                              size: 16,
                                            ),
                                            Text(
                                              "Profile",
                                              style: Theme.of(context).textTheme.titleSmall,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    addHorizontalSpace(10.0),
                                    Text(
                                      _data.profileName ?? 'Username',
                                      style: Theme.of(context).textTheme.titleLarge,
                                    ),
                                  ],
                                ),
                                trailing: _data.profilePhoto == null
                                    ? CircleAvatar(
                                        backgroundColor: primaryGrey,
                                        radius: 30,
                                        child: Icon(
                                          Icons.person,
                                          color:
                                              Theme.of(context).primaryColorLight,
                                          size: 50,
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
              ),
              settingsTile(
                  bg: Theme.of(context).primaryColor,
                  settingsFunction: () async => showDialog(
                      context: context, builder: (ctx) =>const ThemePopup()),
                  head: "Theme",
                  icn: const Icon(Icons.brightness_medium_rounded)),
              settingsTile(
                  bg: Theme.of(context).primaryColor,
                  head: "Notification",
                  icn: const Icon(Icons.notifications_active),
                  trail: const SwitchScreen()),
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
                            addHorizontalSpace(5.0),
                            const Text(
                              
                                ' Do you really want to clear all the\n transactions',textAlign: TextAlign.center,),
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
                head: "Reset Data",
                icn: const Icon(Icons.new_releases_outlined),
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
                  icn: const Icon(Icons.amp_stories_rounded)),
              settingsTile(
                head: 'Rate App',
                bg: Theme.of(context).primaryColor,
                icn: const Icon(Icons.star_purple500_outlined),
                settingsFunction: (){
                  LaunchReview.launch(androidAppId: "in.brototype.coin_wise",
                    );
                },
              ),
              settingsTile(
                  bg: Theme.of(context).primaryColor,
                  head: "Feedback",
                  icn: const Icon(Icons.chat),
                  settingsFunction: () async {
                    _launchURLBrowser();
                  }),
              settingsTile(
                  settingsFunction: () =>
                      showDialog(context: context, builder: (ctx) => AboutApp()),
                  bg: Theme.of(context).primaryColor,
                  head: "About app",
                  icn: const Icon(Icons.info_outline)),
            ],
          ),
        ),
      ),
    );
  }

  Widget settingsTile(
          {required String head,
          Widget? icn,
          Widget? trail,
          Function()? settingsFunction,
          bg,
          fg}) =>
      defaultContainer(
        shadowClr: shadowcolor,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        color: bg,
        boxShadow: const [
          BoxShadow(
            color: primaryBlack,
            offset: Offset(
              1.0,
              1.0,
            ),
            blurRadius: 5.0,
            spreadRadius: .2,
          ),
        ],
        item: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onTap: settingsFunction,
          title: Text(
            head,
            style: title,
          ),
          leading: icn,
          iconColor: fg,
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
