import 'package:carousel_slider/carousel_slider.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/utils/about_utils.dart';
import 'package:folio/utils/utils.dart';
import 'package:folio/utils/work_utils.dart';

import 'package:folio/widget/custom_text_heading.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/widget/about_me_data.dart';

import 'package:folio/widget/tech_widget.dart';

import '../../widget/experience.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: Space.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: CustomSectionHeading(
              text: '\nAbout Me',
            ),
          ),
          const Center(
            child: CustomSectionSubHeading(
              text: 'Get to know me :)',
            ),
          ),
          Space.y1!,
          Image.asset(
            StaticUtils.mobilePhoto,
            height: height * 0.27,
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Text(
            "Who am I?",
            style: AppText.b2!.copyWith(
              color: AppTheme.c!.primary,
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
          Space.y!,
          Text(
            'My experience:',
            style: AppText.b1!.copyWith(
              color: AppTheme.c!.primary,
            ),
          ),
          Space.y1!,

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
              height: 200,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              enlargeCenterPage: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              enableInfiniteScroll: false,
            ),
          ),
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
          Row(
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
          Space.y!,
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AboutMeData(
                    data: "Name",
                    information: "Thanh Dang Trong",
                  ),
                  AboutMeData(
                    data: "Age",
                    information: (DateTime.now().year - 1998).toString(),
                  ),
                ],
              ),
              SizedBox(
                width: width > 710 ? width * 0.2 : width * 0.05,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AboutMeData(
                    data: "Email",
                    information: "thanhdang98@thanhdt.dev",
                  ),
                  AboutMeData(
                    data: "From",
                    information: "Nghe An",
                  ),
                ],
              ),
            ],
          ),
          Space.y1!,
          Row(
            children: [
              SizedBox(
                height: AppDimensions.normalize(13),
                width: AppDimensions.normalize(40),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: AppTheme.c!.primary!,
                    ),
                  ),
                  onPressed: () => html.window.open(StaticUtils.resume, 'pdf'),
                  child: Text(
                    "Resume",
                    style: AppText.l1b!.copyWith(color: AppTheme.c!.primary),
                  ),
                ),
              ),
              Space.x!,
              Container(
                width: width * 0.05,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[900]!,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //       children: WorkUtils.logos
              //           .asMap()
              //           .entries
              //           .map(
              //             (e) => CommunityIconBtn(
              //               icon: e.value,
              //               link: WorkUtils.communityLinks[e.key],
              //               height: WorkUtils.communityLogoHeight[e.key],
              //             ),
              //           )
              //           .toList()),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
