import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:portfolio/appConstents.dart';
import 'package:url_launcher/url_launcher.dart';

import 'models/WorksModel.dart';
import 'models/icon_link_model.dart';

class buildsCard extends StatefulWidget {
  buildsCard(
      {this.assetImage,
      required this.name,
      required this.description,
      required this.links});

  String? assetImage;
  String name;
  String description;
  List<IconLinkModel>? links;

  @override
  State<StatefulWidget> createState() {
    return buildsCardState();
  }
}

class buildsCardState extends State<buildsCard> {
  Color spreadColor = Colors.transparent;
  Color borderColor = Colors.white54;
  Color titleSpreadColor = Colors.transparent;
  Color titleTextColor = Colors.white54;
  Color discpSpreadColor = Colors.transparent;
  Color discpTextColor = Colors.white54;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (size.width <= 850) {
      spreadColor = CardSpreadColor;
      borderColor = Colors.white;
      titleSpreadColor = CardTitleColor;
      titleTextColor = Colors.white;
      discpSpreadColor = CardDescriptionColor;
      discpTextColor = Colors.white;
      setState(() {});
    }
    return InkWell(
      onHover: (state) {
        if (size.width > 850) {
          spreadColor = state ? CardSpreadColor : Colors.transparent;
          borderColor = state ? Colors.white : Colors.white54;
          titleSpreadColor = state ? CardTitleColor : Colors.transparent;
          titleTextColor = state ? Colors.white : Colors.white54;
          discpSpreadColor = state ? CardDescriptionColor : Colors.transparent;
          discpTextColor = state ? Colors.white : Colors.white54;
          setState(() {});
        }
      },
      onTap: () {
        launch(widget.links![0].link);
      },
      child: oNeonContainer(
        clipBehaviour: Clip.antiAlias,
        lightSpreadRadius: size.width > 850 ? 15 : 4,
        lightBlurRadius: size.width > 850 ? 45 : 10,
        borderWidth: 3,
        borderRadius: BorderRadius.circular(CardRadius),
        containerColor: Colors.black,
        spreadColor: spreadColor,
        borderColor: borderColor,
        width: 450,
        height: 410,
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 10,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Image.asset(
                      widget.assetImage ?? "assets/images/idea.png",
                      width: 180,
                      height: 180,
                      fit: BoxFit.fitWidth,
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      oNeonText(
                        blurRadius: 10,
                        isSoftWrap: true,
                        textAlign: TextAlign.center,
                        text: widget.name,
                        spreadColor: titleSpreadColor,
                        textColor: titleTextColor,
                        textSize: 25,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      oNeonText(
                        textAlign: TextAlign.justify,
                        text: widget.description,
                        maxLine: 6,
                        textOverflow: TextOverflow.ellipsis,
                        spreadColor: discpSpreadColor,
                        textColor: discpTextColor,
                        textSize: 15,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.bottomLeft,
              child: Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    ...(widget.links != null
                        ? widget.links!.map((e) => InkWell(
                              onTap: () {
                                launch(e.link);
                              },
                              child: Image.asset(
                                e.imageAddress,
                                width: 40,
                                height: 40,
                                fit: BoxFit.fitHeight,
                              ),
                            ))
                        : []),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}

class worksCard extends StatefulWidget {
  worksCard(
      {required this.worksModel,
      required this.screenSize,
      required this.parentPadding});

  WorksModel worksModel;
  Size screenSize;
  double parentPadding;

  @override
  State<StatefulWidget> createState() {
    return worksCardState();
  }
}

class worksCardState extends State<worksCard> {
  Color spreadColor = Colors.transparent;
  Color borderColor = Colors.white54;
  Color titleSpreadColor = Colors.transparent;
  Color titleTextColor = Colors.white54;
  Color discpSpreadColor = Colors.transparent;
  Color discpTextColor = Colors.white54;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (size.width <= 850) {
      spreadColor = CardSpreadColor;
      borderColor = Colors.white;
      titleSpreadColor = CardTitleColor;
      titleTextColor = Colors.white;
      discpSpreadColor = CardDescriptionColor;
      discpTextColor = Colors.white;
      setState(() {});
    }
    return InkWell(
      onHover: (state) {
        if (size.width > 850) {
          spreadColor = state ? CardSpreadColor : Colors.transparent;
          borderColor = state ? Colors.white : Colors.white54;
          titleSpreadColor = state ? CardTitleColor : Colors.transparent;
          titleTextColor = state ? Colors.white : Colors.white54;
          discpSpreadColor = state ? CardDescriptionColor : Colors.transparent;
          discpTextColor = state ? Colors.white : Colors.white54;
          setState(() {});
        }
      },
      onTap: () {
        launch(widget.worksModel.link ?? "");
      },
      child: oNeonContainer(
        width: 450,
        height: 260,
        spreadColor: spreadColor,
        borderColor: borderColor,
        padding: EdgeInsets.all(CardPadding),
        containerColor: Colors.black,
        borderRadius: BorderRadius.circular(10),
        borderWidth: 3,
        lightSpreadRadius: size.width > 850 ? 10 : 4,
        lightBlurRadius: size.width > 850 ? 25 : 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  widget.worksModel.logo ?? "assets/images/office-building.png",
                  width: 65,
                  height: 65,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    oNeonText(
                      text: widget.worksModel.companyName,
                      fontWeight: FontWeight.bold,
                      spreadColor: titleSpreadColor,
                      textSize: CardTitleFontSize,
                      textColor: titleTextColor,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    SizedBox(
                      width: widget.screenSize.width <
                              450 + 2 * widget.parentPadding
                          ? widget.screenSize.width -
                              2 * CardPadding -
                              2 * widget.parentPadding -
                              130
                          : 300,
                      child: oNeonText(
                        textOverflow: TextOverflow.ellipsis,
                        maxLine: 2,
                        textAlign: TextAlign.start,
                        text: widget.worksModel.title,
                        spreadColor: discpSpreadColor,
                        textColor: discpTextColor,
                        fontWeight: FontWeight.w400,
                        textSize: CardTitleFontSize - 5,
                        isSoftWrap: true,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    oNeonText(
                      text:
                          "${widget.worksModel.startDate} - ${widget.worksModel.endDate}",
                      spreadColor: discpSpreadColor,
                      textColor: discpTextColor,
                      fontWeight: FontWeight.w200,
                      textSize: CardDescriptionFontSize,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            oNeonText(
              maxLine: 6,
              spreadColor: discpSpreadColor,
              textColor: discpTextColor,
              isSoftWrap: true,
              textAlign: TextAlign.start,
              text: "${widget.worksModel.description}",
              fontWeight: FontWeight.bold,
              textSize: CardDescriptionFontSize,
              blurRadius: 10,
            )
          ],
        ),
      ),
    );
  }
}
