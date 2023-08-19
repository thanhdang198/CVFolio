import 'package:flutter/material.dart';
import 'package:folio/sections/about/about.dart';
import 'package:folio/sections/contact/contact.dart';
import 'package:folio/sections/home/home.dart';
import 'package:folio/sections/portfolio/portfolio.dart';
import 'package:folio/sections/services/services.dart';
import 'package:folio/widget/footer.dart';

class StaticUtils {
  static const String hi = 'assets/hi.gif';

  // photos
  static const String mobilePhoto = 'assets/photos/mobile.png';
  static const String coloredPhoto = 'assets/photos/colored.png';
  static const String blackWhitePhoto = 'assets/photos/black-white.png';

  // work
  static const String dsc = 'assets/work/dsc.png';
  static const String gostream = 'assets/work/gostream.png';
  static const String university = 'assets/work/vinh.png';
  static const String vietmap = 'assets/work/vm.png';

  // services
  static const String uiux = 'assets/services/ui.png';
  static const String blog = 'assets/services/blog.png';
  static const String appDev = 'assets/services/app.png';
  static const String rapid = 'assets/services/rapid.png';
  static const String openSource = 'assets/services/open.png';
  static const String openSourceBlack = 'assets/services/open_b.png';

  static const List<String> socialIconURL = [
    "https://img.icons8.com/metro/208/ffffff/facebook-new--v2.png",
    "https://img.icons8.com/metro/308/ffffff/linkedin.png",
    "https://img.icons8.com/material-rounded/384/ffffff/github.png",
    "https://img.icons8.com/?size=512&id=84866&format=png"
  ];

  static const List<String> socialLinks = [
    "https://facebook.com/thanhdang98",
    "https://linkedin.com/in/thanhdang98",
    "https://github.com/thanhdang198",
    "mailto:thanhdang98@thanhdt.dev"
  ];

  static const String resume =
      'https://www.canva.com/design/DAFEbRzfZR0/ATxJ6KlbvpS3ZykGVCzyYg/edit?utm_content=DAFEbRzfZR0&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton';

  static const String gitHub = 'https://github.com/thanhdang198';
}

class BodyUtils {
  static const List<Widget> views = [
    HomePage(),
    About(),
    Services(),
    Portfolio(),
    Contact(),
    Footer(),
  ];
}
