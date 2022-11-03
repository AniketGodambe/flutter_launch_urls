import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_launch_urls/screens/util/common_ui.dart';
import 'package:get/get.dart';
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
