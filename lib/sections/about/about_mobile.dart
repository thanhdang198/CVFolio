import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/utils/about_utils.dart';
import 'package:folio/utils/utils.dart';

import 'package:folio/widget/custom_text_heading.dart';
import 'package:universal_html/html.dart' as html;

import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/widget/about_me_data.dart';
import 'package:folio/widget/tech_widget.dart';

import '../../utils/work_utils.dart';
import '../../widget/experience.dart';

class AboutMobile extends StatelessWidget {
  const AboutMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: Space.h,
      child: Column(
        children: [
          const CustomSectionHeading(
            text: '\nAbout Me',
          ),
          const CustomSectionSubHeading(
            text: 'Get to know me :)',
          ),
          Space.y1!,
          Image.asset(
            StaticUtils.mobilePhoto,
            height: height * 0.27,
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Who am I?",
              style: AppText.b2!.copyWith(
                color: AppTheme.c!.primary,
              ),
            ),
          ),
          Space.y1!,
          Text(
            AboutUtils.aboutMeHeadline,
            style: AppText.b2b!.copyWith(
              fontFamily: 'Montserrat',
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            AboutUtils.aboutMeDetail,
            style: AppText.l1!.copyWith(
              height: 2,
              letterSpacing: 1.1,
              fontFamily: 'Montserrat',
            ),
          ),
          Space.y!,
          Divider(
            color: Colors.grey[800],
            thickness: AppDimensions.normalize(0.5),
          ),
          Text(
            'My experience:',
            style: AppText.b1!.copyWith(
              color: AppTheme.c!.primary,
            ),
          ),
          Space.y1!,
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: WorkUtils.communityLinks
          //         .map((e) => CompanyExperience(
          //               projectLink: e,
          //               banner: WorkUtils
          //                   .logos[WorkUtils.communityLinks.indexOf(e)],
          //               projectTitle: WorkUtils.experienceTitle[
          //                   WorkUtils.communityLinks.indexOf(e)],
          //               projectDescription: WorkUtils.experienceDescription[
          //                   WorkUtils.communityLinks.indexOf(e)],
          //             ))
          //         .toList(),
          //   ),
          // ),

          CarouselSlider.builder(
            itemCount: WorkUtils.communityLinks.length,
            itemBuilder: (BuildContext context, int itemIndex, int i) =>
                Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: CompanyExperience(
                projectLink: WorkUtils.communityLinks[i],
                banner: WorkUtils.logos[i],
                projectTitle: WorkUtils.experienceTitle[i],
                projectDescription: WorkUtils.experienceDescription[i],
              ),
            ),
            options: CarouselOptions(
              viewportFraction: 0.65,
              height: 150,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              enlargeCenterPage: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              enableInfiniteScroll: false,
            ),
          ),
          Space.y1!,
          Divider(
            color: Colors.grey[800],
            thickness: AppDimensions.normalize(0.5),
          ),
          Space.y1!,
          Text(
            'Technologies I have worked with:',
            style: AppText.l1!.copyWith(
              color: AppTheme.c!.primary,
            ),
          ),
          Space.y!,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: kTools
                .map(
                  (e) => ToolTechWidget(techName: e),
                )
                .toList(),
          ),
          Space.y!,
          Divider(
            color: Colors.grey[800],
            thickness: AppDimensions.normalize(0.5),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          const AboutMeData(
            data: "Name",
            information: "Thanh Dang",
          ),
          const AboutMeData(
            data: "Email",
            information: "thanhdang98@thanhdt.dev",
          ),
          Space.y!,
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: AppTheme.c!.primary!,
                ),
              ),
              child: Text(
                "Resume",
                style: AppText.l1b!.copyWith(color: AppTheme.c!.primary),
              ),
              onPressed: () {
                kIsWeb
                    ? html.window.open(StaticUtils.resume, "pdf")
                    : openURL(StaticUtils.resume);
              }),
        ],
      ),
    );
  }
}
