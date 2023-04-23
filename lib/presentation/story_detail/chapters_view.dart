import 'package:app_truyen/domain/model/chapter_model.dart';
import 'package:app_truyen/utils/color_manager.dart';
import 'package:app_truyen/utils/font_manager.dart';
import 'package:app_truyen/utils/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChaptersView extends StatefulWidget {
  const ChaptersView({super.key, required this.chapters});
  final List<Chapter> chapters;
  @override
  State<ChaptersView> createState() => _ChaptersViewState();
}

class _ChaptersViewState extends State<ChaptersView> {
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
          foregroundColor: ColorManager.primary,
          title: Text(
            "Danh sách chương",
            style: Theme.of(context).textTheme.displaySmall,
          )),
      body: ListView(
        children: widget.chapters.reversed
            .map((chapter) => Container(
                  margin: const EdgeInsets.all(5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  decoration: BoxDecoration(
                      color: ColorManager.lightGray,
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    chapter.header,
                    style: getMediumStyle(
                        color: Colors.black, fontSize: FontSizeManager.s14),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
