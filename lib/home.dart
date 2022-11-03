import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Luanch Apps URL's"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 30, bottom: 30),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 2,
                      spreadRadius: 5,
                      offset: const Offset(2, 3),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgContainerUI(
                      img: "assets/ic_whatsapp.svg",
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialog(
                              title: "Are you sure",
                              description: 'You want to launch Whatsapp?',
                              btnTitle: 'Okay',
                              onTap: () {
                                openWhatsApp("9421428205");
                                Get.back();
                              },
                              cancelBtnText: 'NO',
                            );
                          },
                        );
                        log("ic_whatsapp");
                      },
                    ),
                    SvgContainerUI(
                      img: "assets/ic_facebook.svg",
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialog(
                              title: "Are you sure",
                              description: 'You want to launch Facebook?',
                              btnTitle: 'Okay',
                              onTap: () {
                                _launchUrl(
                                    "https://www.facebook.com/aniket.godambe.1");
                                Get.back();
                              },
                              cancelBtnText: 'NO',
                            );
                          },
                        );
                        log("ic_facebook");
                      },
                    ),
                    SvgContainerUI(
                      img: "assets/ic_insta.svg",
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialog(
                              title: "Are you sure",
                              description: 'You want to launch Instagram?',
                              btnTitle: 'Okay',
                              onTap: () {
                                _launchUrl(
                                    "https://www.instagram.com/aniket18._/");
                                Get.back();
                              },
                              cancelBtnText: 'NO',
                            );
                          },
                        );
                        log("ic_insta");
                      },
                    ),
                    SvgContainerUI(
                      img: "assets/ic_twitter.svg",
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialog(
                              title: "Are you sure",
                              description: 'You want to launch Twitter?',
                              btnTitle: 'Okay',
                              onTap: () {
                                _launchUrl("https://twitter.com/GodambeAniket");
                                Get.back();
                              },
                              cancelBtnText: 'NO',
                            );
                          },
                        );
                        log("ic_twitter");
                      },
                    ),
                    SvgContainerUI(
                      img: "assets/ic_linkden.svg",
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialog(
                              title: "Are you sure",
                              description: 'You want to launch Linkden?',
                              btnTitle: 'Okay',
                              onTap: () {
                                _launchUrl(
                                    "https://www.linkedin.com/in/aniket-godambe-4543b41b6/");
                                Get.back();
                              },
                              cancelBtnText: 'NO',
                            );
                          },
                        );
                        log("ic_linkden");
                      },
                    ),
                    SvgContainerUI(
                      img: "assets/ic_telegram.svg",
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialog(
                              title: "Are you sure",
                              description: 'You want to launch Telegram?',
                              btnTitle: 'Okay',
                              onTap: () {
                                _launchUrl("https://web.telegram.org/");
                                Get.back();
                              },
                              cancelBtnText: 'NO',
                            );
                          },
                        );
                        log("ic_telegram");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  openWhatsApp(String phone) async {
    if (await canLaunch('https://wa.me/+91$phone')) {
      print("Working");
      await launch('https://wa.me/+91$phone');
    } else {
      print("Working not ");
      throw 'Could not launch';
    }
  }
}

class SvgContainerUI extends StatelessWidget {
  final String img;
  final VoidCallback onTap;
  const SvgContainerUI({Key? key, required this.img, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        img,
        height: 40,
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    this.description,
    required this.cancelBtnText,
    required this.btnTitle,
    this.onTap,
    this.title,
  }) : super(key: key);
  final String? description, title;
  final String btnTitle, cancelBtnText;
  final VoidCallback? onTap;

  dialogContent(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: [
          const SizedBox(height: 30.0),
          Text(
            title.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 21.0,
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            description.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.blue.withOpacity(0.8),
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 30.0),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: Get.width / 3,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      cancelBtnText.toString(),
                      style: const TextStyle(
                        fontSize: 17.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: onTap,
                  child: Container(
                    alignment: Alignment.center,
                    width: Get.width / 3,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      btnTitle.toString(),
                      style: const TextStyle(
                        fontSize: 17.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.red,
      child: dialogContent(context),
    );
  }
}
