import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:six_cash/controller/splash_controller.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/util/images.dart';
import 'package:six_cash/util/styles.dart';
import 'package:six_cash/view/base/custom_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../controller/language_controller.dart';
import '../../chat/chat_screen.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final splashController =  Get.find<SplashController>();
    return Scaffold(
      appBar: CustomAppbar(title: '24_support'.tr),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_OVER_LARGE),
              child: Image.asset(Images.support_image),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal:  Dimensions.PADDING_SIZE_EXTRA_OVER_LARGE),
            //   child: Lottie.asset(Images.customer_support, fit: BoxFit.contain, alignment: Alignment.center),
            // ),
            Text('need_any_help'.tr, style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_OVER_OVER_LARGE, color: ColorResources.getSupportScreenTextColor())),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL),
              child: Text('feel_free_to_contact'.tr, style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE, color: ColorResources.getSupportScreenTextColor()), textAlign: TextAlign.center),
            ),


            if(splashController.configModel.companyPhone != null)
              Padding(
              padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_LARGE, right: Dimensions.PADDING_SIZE_LARGE, top: Dimensions.PADDING_SIZE_OVER_LARGE, bottom: Dimensions.PADDING_SIZE_LARGE),
              child: InkWell(
                highlightColor: Theme.of(context).secondaryHeaderColor,
                onTap: () async => await launch('tel://${splashController.configModel.companyPhone}'),
                child: Container(
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(Icons.phone), Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
                      child: Text('make_call'.tr, style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
                    )
                  ]),
                   // height: Dimensions.PADDING_SIZE_EXTRA_OVER_LARGE,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.RADIUS_SIZE_EXTRA_SMALL), border: Border.all(color: Theme.of(context).secondaryHeaderColor, width: Dimensions.DIVIDER_SIZE_MEDIUM), )),
              ),
            ),

            if(splashController.configModel.companyEmail != null) Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
              child: InkWell(
                highlightColor: Theme.of(context).secondaryHeaderColor,
                onTap: () async {
                  final Uri params = Uri(scheme: 'mailto', path: splashController.configModel.companyEmail); String  url = params.toString();
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
                child: Container(
                    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.email), Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
                    child: Text('send_email'.tr, style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
                  )],),
                   // height: Dimensions.PADDING_SIZE_EXTRA_OVER_LARGE,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.RADIUS_SIZE_EXTRA_SMALL), color: Theme.of(context).secondaryHeaderColor)),
              ),
            ),


            SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_LARGE),
              child: InkWell(
                highlightColor: ColorResources.getSecondaryHeaderColor(),
                onTap: () async {
                  LanguageController controller=Get.find();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (B) => ChatScreen(
                            title: "Text chat",
                            url: "https://support.omninovas.com/index.php?p=link&sp=9&ssp=fr",
                          )));
                },
                child: Container(
                    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.chat),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Dimensions.PADDING_SIZE_SMALL),
                          child: Text("Chat Support",
                              style: rubikRegular.copyWith(
                                  fontSize: Dimensions.FONT_SIZE_LARGE)),
                        )
                      ],
                    ),
                    // height: Dimensions.PADDING_SIZE_EXTRA_OVER_LARGE,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            Dimensions.RADIUS_SIZE_EXTRA_SMALL),
                        color: ColorResources.getSecondaryHeaderColor())),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_LARGE),
              child: InkWell(
                highlightColor: ColorResources.getSecondaryHeaderColor(),
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (B) => ChatScreen(
                            title: "Live chat",
                            url: "https://ok.omninovas.com/livechat",
                          )));
                },
                child: Container(
                    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.video_call),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Dimensions.PADDING_SIZE_SMALL),
                          child: Text("Live Support",
                              style: rubikRegular.copyWith(
                                  fontSize: Dimensions.FONT_SIZE_LARGE)),
                        )
                      ],
                    ),
                    // height: Dimensions.PADDING_SIZE_EXTRA_OVER_LARGE,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            Dimensions.RADIUS_SIZE_EXTRA_SMALL),
                        color: ColorResources.getSecondaryHeaderColor())),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_OVER_LARGE),
            //   child: Stack(
            //     children: [
            //       Image.asset(Images.support_image),
            //       Positioned(
            //           bottom: 10,
            //           left: 0,
            //           right: 0,
            //           child: Column(
            //             children: [
            //               Align(
            //                   alignment: Alignment.bottomCenter,
            //                   child: Text('Data Data')),
            //             ],
            //           ))
            //     ],
            //   ),
            // ),
            //Text('Data Data'),
            // if(splashController.configModel.companyPhone != null) Row(
            //   children: [
            //     Text('phone'.tr),
            //     TextButton(onPressed: () async => await launch('tel://${splashController.configModel.companyPhone}'), child: Text(splashController.configModel.companyPhone)),
            //   ],
            // ),
            // if(splashController.configModel.companyEmail != null) Row(
            //   children: [
            //     Text('email'.tr),
            //     TextButton(onPressed: () async {
            //       final Uri params = Uri(scheme: 'mailto', path: splashController.configModel.companyEmail); String  url = params.toString();
            //         if (await canLaunch(url)) {
            //           await launch(url);
            //         } else {
            //           print('cant lunch');
            //         }
            //     },
            //         child: Text(splashController.configModel.companyEmail))//=> await launch('*/*://${splashController.configModel.companyEmail}'), child: Text(splashController.configModel.companyEmail)),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
