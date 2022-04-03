import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:portfolio/data_file.dart';
import 'package:url_launcher/url_launcher.dart';

import 'cards.dart';

Color color =
    Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

List<Widget> widgetTreeVertical(size) {
  return [
    Container(
      clipBehavior: Clip.none,
      padding: const EdgeInsets.all(20),
      height: size.height,
      alignment: Alignment.center,
      width: size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        clipBehavior: Clip.none,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                oFlickerNeonText(
                  flickerTimeInMilliSeconds: 1000,
                  randomFlicker: true,
                  text: PortfolioDetails.myName,
                  textSize: 74,
                  blurRadius: 20,
                  spreadColor: color,
                ),
                Container(
                  clipBehavior: Clip.none,
                  height: size.width,
                  width: size.width,
                  alignment: Alignment.bottomRight,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, size.height / 5, 0, 0),
                        alignment: Alignment.topCenter,
                        child: oNeonLine(
                          lineWidth: size.width,
                          lineHeight: 3,
                          lightSpreadRadius: 2,
                          lightBlurRadius: 15,
                          spreadColor: color,
                        ),
                        clipBehavior: Clip.none,
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: ClipPath(
                          clipper: TriangleClipperVertical(),
                          child: Image.asset(
                            PortfolioDetails.profileImage,
                            fit: BoxFit.fitHeight,
                            height: size.width,
                            width: size.width * 0.9,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: size.width / 2 - 20,
                        child: oNeonLine(
                          transformAlignment: Alignment.bottomRight,
                          transform: Matrix4.rotationZ(atan(2.2)),
                          lineWidth: size.width / sin(atan(2.2)),
                          lineHeight: 3,
                          lightSpreadRadius: 5,
                          lightBlurRadius: 30,
                          spreadColor: color,
                          // spreadColor: Colors.green,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: size.width / 2 - 20,
                        child: oNeonLine(
                          transformAlignment: Alignment.bottomRight,
                          transform: Matrix4.rotationZ(
                            pi - atan(2.2),
                          ),
                          lineWidth: size.width / sin(atan(2.2)),
                          lineHeight: 3,
                          lightSpreadRadius: 5,
                          lightBlurRadius: 30,
                          spreadColor: color,
                          // spreadColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                oNeonText(
                  text: PortfolioDetails.bio,
                  textSize: 25,
                  blurRadius: 10,
                  spreadColor: Colors.green,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...(PortfolioDetails.socials.map(
                  (e) => InkWell(
                    onTap: () {
                      launch(e.link);
                    },
                    child: Image.asset(
                      e.imageAddress,
                      height: 50,
                      width: 50,
                    ),
                  ),
                )),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: oNeonText(
                text: "Ojas Builds",
                spreadColor: color,
                textSize: 35,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Wrap(
              spacing: 20,
              runSpacing: 30,
              children: [
                ...(PortfolioDetails.experienceList
                    .map((e) => buildsCard(
                        assetImage: e.assetImage,
                        name: e.name,
                        description: e.description,
                        links: e.links))
                    .toList())
              ],
            )
          ],
        ),
      ),
    ),
  ];
}

class TriangleClipperVertical extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width / 2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipperVertical oldClipper) => false;
}
