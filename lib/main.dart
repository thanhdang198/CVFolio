import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:folio/extension/date_extension.dart';
import 'package:folio/provider/app_provider.dart';
import 'package:folio/provider/drawer_provider.dart';
import 'package:folio/provider/scroll_provider.dart';
import 'package:folio/sections/main/main_section.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:folio/configs/core_theme.dart' as theme;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
        measurementId: 'G-V77JRJ3ZPL',
        apiKey: 'AIzaSyDFE2VU8smsUO66UcZ6JRR-QLZcOVchX1k',
        appId: '1:1065787546688:web:a9fe74c32c8131b14bd3a5',
        messagingSenderId: '1065787546688',
        storageBucket: 'portfolio-dd598.appspot.com',
        authDomain: 'portfolio-dd598.firebaseapp.com',
        projectId: 'portfolio-dd598'),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => DrawerProvider()),
        ChangeNotifierProvider(create: (_) => ScrollProvider()),
      ],
      child: Consumer<AppProvider>(
        builder: (context, value, _) => MaterialChild(
          provider: value,
        ),
      ),
    );
  }
}

class MaterialChild extends StatefulWidget {
  final AppProvider provider;
  const MaterialChild({Key? key, required this.provider}) : super(key: key);

  @override
  State<MaterialChild> createState() => _MaterialChildState();
}

class _MaterialChildState extends State<MaterialChild> {
  void initAppTheme() {
    final appProviders = AppProvider.state(context);
    appProviders.init();
  }

  @override
  void initState() {
    initAppTheme();

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      incrementVisitCount();
    });
  }

  incrementVisitCount() async {
    var db = FirebaseFirestore.instance;
    var ref = db.collection('visitCount').doc('allVisited');
    await ref.update({
      'count': FieldValue.increment(1),
    });

    DateTime now = DateTime.now();
    var checkIfToDayDocExits =
        await db.collection('visitCount').doc(now.getDayMonthYear()).get();

    if (!checkIfToDayDocExits.exists) {
      await db.collection('visitCount').doc(now.getDayMonthYear()).set({
        'count': 1,
      });
    } else {
      await db.collection('visitCount').doc(now.getDayMonthYear()).update({
        'count': FieldValue.increment(1),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thanh',
      theme: theme.themeLight.copyWith(
        textTheme: theme.themeLight.textTheme.apply(
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
      ),
      darkTheme: theme.themeDark,
      themeMode: widget.provider.themeMode,
      initialRoute: "/",
      routes: {
        "/": (context) => const MainPage(),
      },
    );
  }
}
