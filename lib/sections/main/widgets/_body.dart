part of '../main_section.dart';

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);
    // return SizedBox(
    //   height: UI.height,
    //   child: CarouselSlider.builder(
    //       itemCount: BodyUtils.views.length,
    //       itemBuilder: (_, index, __) => BodyUtils.views[index],
    //       options: CarouselOptions(
    //         scrollDirection: Axis.vertical,
    //       )),
    // );
    return ListView.builder(
      controller: scrollProvider.controller,
      itemCount: BodyUtils.views.length,
      itemBuilder: (context, index) => BodyUtils.views[index],
    );
  }
}
