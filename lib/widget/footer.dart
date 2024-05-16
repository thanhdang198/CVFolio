// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/extension/date_extension.dart';
import 'package:folio/extension/number_extension.dart';
// import 'package:folio/extension/date_extension.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(0, height * 0.05, 0, 0),
      height: height * 0.07,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
              child: Row(mainAxisSize: MainAxisSize.min, children: [
            const Text('Visited: '),
            // get version from firebase
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('visitCount')
                  .doc('allVisited')
                  .snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  int count = snapshot.data['count'];
                  return Text(
                    count.convertToCurrency(),
                    style: const TextStyle(color: Colors.blue),
                  );
                } else {
                  return const Text(
                    '0',
                    style: TextStyle(color: Colors.blue),
                  );
                }
              },
            ),
            const Text(' - Today visited: '),
            // get version from firebase
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('visitCount')
                  .doc(DateTime.now().getDayMonthYear())
                  .snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  int count = snapshot.data['count'];
                  return Text(
                    count.convertToCurrency() + ' 💙',
                    style: const TextStyle(color: Colors.blue),
                  );
                } else {
                  return const Text(
                    '0',
                    style: TextStyle(color: Colors.blue),
                  );
                }
              },
            ),
          ])),
          const SizedBox(height: 10),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Developed in 💙 with ",
                ),
                InkWell(
                  onTap: () => openURL("https://github.com/thanhdang198"),
                  child: const Text(
                    "Flutter web - wasm",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
