
import 'package:coin_wise/core/constants/colors.dart';
import 'package:coin_wise/core/constants/data.dart';
import 'package:coin_wise/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Coin Wise'),
          ],
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              alignment: Alignment.center,
              child: Text(
                aboutAppText,
                style: const TextStyle(),
                textAlign: TextAlign.center,
              )),
        ),
        Container(
          color: primaryBlack,
          height: displayHeight(context) * .04,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                    image: AssetImage(
                  './assets/images/log.jpg',
                )),
                addVerticalSpace(10.0),
                const Image(
                    image: AssetImage(
                  './assets/images/flutter.jpg',
                )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
