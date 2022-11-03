import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
