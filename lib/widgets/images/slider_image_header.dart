import 'package:flutter/material.dart';
import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/utils/size_utils.dart';
import 'package:wahg_v1/widgets/images/custom_image_view.dart';

class SliderImage extends StatefulWidget {
  final List<String> imagesList;
  const SliderImage(this.imagesList, {super.key});

  @override
  SliderImageState createState() => SliderImageState();
}

class SliderImageState extends State<SliderImage> {
  int page = 0;
  static const int MAX = 5;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      elevation: 2,
      margin: const EdgeInsets.all(0),
      child: Container(
        height: 250,
        child: Stack(
          children: <Widget>[
            PageView(
              onPageChanged: onPageViewChange,
              children: widget.imagesList
                  .map(
                    (imagePath) => CustomImageView(
                      imagePath: imagePath,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  )
                  .toList(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.5)
                    ])),
                child: Align(
                  alignment: Alignment.center,
                  child: buildDots(context),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onPageViewChange(int _page) {
    page = _page;
    setState(() {});
  }

  Widget buildDots(BuildContext context) {
    Widget widget;

    List<Widget> dots = [];
    for (int i = 0; i < MAX; i++) {
      Widget w = Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 8,
        width: 8,
        child: CircleAvatar(
          backgroundColor: page == i ? Colors.blue : Colors.grey[100],
        ),
      );
      dots.add(w);
    }
    widget = Row(
      mainAxisSize: MainAxisSize.min,
      children: dots,
    );
    return widget;
  }
}
