import 'package:flutter/material.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/constants.dart';
import 'package:folio/utils/about_utils.dart';

import 'package:folio/utils/utils.dart';
import 'package:folio/utils/work_utils.dart';
import 'package:folio/widget/about_me_data.dart';
import 'package:folio/widget/custom_text_heading.dart';
import 'package:folio/widget/experience.dart';
import 'package:folio/widget/tech_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:universal_html/html.dart' as html;

class AboutDesktop extends StatelessWidget {
  const AboutDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
          Row(
            children: [
              Expanded(
                child: Image.asset(
                  StaticUtils.coloredPhoto,
                  height: height * 0.7,
                ),
              ),
              Expanded(
                flex: width < 1230 ? 2 : 1,
                child: Container(
                  padding: EdgeInsets.only(left: width < 1230 ? 25.0 : 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Who am I?',
                        style: AppText.b1!.copyWith(
                          color: AppTheme.c!.primary,
                        ),
                      ),
                      Space.y1!,
                      Text(
                        AboutUtils.aboutMeHeadline,
                        style: AppText.b1b!.copyWith(
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                        ),
                      ),
                      Space.y!,
                      Text(
                        AboutUtils.aboutMeDetail,
                        style: AppText.b2!.copyWith(
                          height: 2,
                          letterSpacing: 1.1,
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                          fontSize: AppDimensions.normalize(5),
                        ),
                        textAlign: TextAlign.justify,
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
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: WorkUtils.communityLinks
                            .map((e) => CompanyExperience(
                                  projectLink: e,
                                  banner: WorkUtils.logos[
                                      WorkUtils.communityLinks.indexOf(e)],
                                  projectTitle: WorkUtils.experienceTitle[
                                      WorkUtils.communityLinks.indexOf(e)],
                                  projectDescription:
                                      WorkUtils.experienceDescription[
                                          WorkUtils.communityLinks.indexOf(e)],
                                ))
                            .toList(),
                      ),
                      /*
                      InkWell(
                                  onTap: () {
                                    launchUrlString(e);
                                  },
                                  child: Image.asset(
                                    WorkUtils.logos[
                                        WorkUtils.communityLinks.indexOf(e)],
                                    width: AppDimensions.normalize(
                                        MediaQuery.of(context).size.width *
                                            0.1),
                                  ),
                                )
                      */
                      Space.y1!,
                      Divider(
                        color: Colors.grey[800],
                        thickness: AppDimensions.normalize(0.5),
                      ),
                      Space.y!,
                      Text(
                        'Technologies I have worked with:',
                        style: AppText.l1!.copyWith(
                          color: AppTheme.c!.primary,
                        ),
                      ),
                      Space.y!,
                      Row(
                        children: kTools
                            .map((e) => ToolTechWidget(
                                  techName: e,
                                ))
                            .toList(),
                      ),
                      Space.y!,
                      Divider(
                        color: Colors.grey[800],
                        thickness: AppDimensions.normalize(0.5),
                      ),
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
                                information:
                                    (DateTime.now().year - 1998).toString(),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AboutMeData(
                                data: "Email",
                                information: "contact@thanhdt.dev",
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
                              onPressed: () =>
                                  html.window.open(StaticUtils.resume, 'pdf'),
                              child: Text(
                                "Resume",
                                style: AppText.l1b!
                                    .copyWith(color: AppTheme.c!.primary),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: width < 1230 ? width * 0.05 : width * 0.1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
