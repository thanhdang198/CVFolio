// import 'dart:html' show window;

import 'package:universal_html/html.dart';
import 'package:url_launcher/url_launcher.dart';

// URL Launcher
void openURL(String url) => launchUrl(
      Uri.parse(url),
    );

// Tools & Tech
final kTools = [
  "Flutter",
  "Dart",
  "Kotlin/Java",
  "Swift",
  "React Native",
];

getOSInsideWeb() {
  var userAgent = window.navigator.userAgent;
  var name = 'Unknown';
  var icon = '🤷‍♂️';
  if (userAgent.contains('Mac OS X')) {
    name = 'MacOS';
    icon = '🍎';
  } else if (userAgent.contains('iPhone')) {
    name = 'iOS';
    icon = '📱';
  } else if (userAgent.contains('Linux')) {
    name = 'Linux';
    icon = '🐧';
  } else if (userAgent.contains('Windows')) {
    name = 'Windows';
    icon = '🪟';
  } else if (userAgent.contains('Android')) {
    name = 'Android';
    icon = '🤖';
  }
  return name;
}
