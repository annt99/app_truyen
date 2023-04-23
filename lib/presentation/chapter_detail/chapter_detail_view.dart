import 'package:app_truyen/app/di.dart';
import 'package:app_truyen/core/state_renderer/state_render_impl.dart';
import 'package:app_truyen/domain/model/chapter_detail_model.dart';
import 'package:app_truyen/domain/model/chapter_model.dart';
import 'package:app_truyen/domain/usecase/get_chapter_detail_usecase.dart';
import 'package:app_truyen/presentation/chapter_detail/cubit/chapter_detail_cubit.dart';
import 'package:app_truyen/utils/color_manager.dart';
import 'package:app_truyen/utils/font_manager.dart';
import 'package:app_truyen/utils/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class ChapterDetailView extends StatefulWidget {
  const ChapterDetailView(
      {super.key, required this.chapter, required this.chapters});
  final Chapter chapter;
  final List<Chapter> chapters;

  @override
  State<ChapterDetailView> createState() => _ChapterDetailViewState();
}

class _ChapterDetailViewState extends State<ChapterDetailView> {
  late int _currentPage;
  late PageController _controller;

  @override
  Widget build(BuildContext context) {
    _currentPage = widget.chapters.indexOf(widget.chapter);
    _controller = PageController(initialPage: _currentPage);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
        body: PageView.builder(
      controller: _controller,
      itemCount: widget.chapters.length,
      scrollDirection: Axis.horizontal,
      onPageChanged: (index) {
        _currentPage = index;
      },
      itemBuilder: (context, index) {
        return BlocProvider<ChapterDetailCubit>(
          create: (context) =>
              ChapterDetailCubit(instance<GetChapterDetailUsecase>())
                ..getChapterDetail(widget.chapters[index].id),
          child: BlocBuilder<ChapterDetailCubit, ChapterDetailState>(
            builder: (context, state) {
              if (state is ChapterDetailLoaded) {
                return _getContentWidget(context, state.chapter, index);
              }
              return state.getScreenWidget(
                  context,
                  Container(),
                  () => context
                      .read<ChapterDetailCubit>()
                      .getChapterDetail(widget.chapters[index].id));
            },
          ),
        );
      },
    ));
  }

  Widget _getContentWidget(
      BuildContext context, ChapterDetail chapterDetail, int index) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              child: Row(
                children: [
                  Text(
                    'Chương ${index + 1}/${widget.chapters.length}',
                    style: getMediumStyle(color: Colors.black, fontSize: 10),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        _showSettingsDialog(context);
                      },
                      icon: Icon(
                        Icons.more_horiz,
                        color: ColorManager.primary,
                      ))
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                primary: true,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        chapterDetail.header,
                        textAlign: TextAlign.center,
                        style: getBoldStyle(
                            color: const Color.fromARGB(255, 0, 97, 3),
                            fontSize: FontSizeManager.s20),
                      ),
                    ),
                    Html(data: chapterDetail.toString())
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int brightnessValue = 50;
        double fontSizeValue = 16.0;
        Color backgroundColor = Colors.white;
        return StatefulBuilder(builder: (context, mySetState) {
          return AlertDialog(
            title: Text('Settings'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Brightness',
                  style: getMediumStyle(
                      color: Colors.black, fontSize: FontSizeManager.s14),
                ),
                Slider(
                  value: brightnessValue.toDouble(),
                  min: 0,
                  max: 100,
                  divisions: 10,
                  onChanged: (double value) {
                    mySetState(() {
                      brightnessValue = value.round();
                    });
                  },
                ),
                Text(
                  'Font Size',
                  style: getMediumStyle(
                      color: Colors.black, fontSize: FontSizeManager.s14),
                ),
                Slider(
                  value: fontSizeValue,
                  min: 0.8,
                  max: 2,
                  divisions: 10,
                  onChanged: (double value) {
                    mySetState(() {
                      fontSizeValue = value;
                    });
                  },
                ),
                Text('Background Color'),
                // ColorPicker(
                //   pickerColor: backgroundColor,
                //   onColorChanged: (Color color) {
                //     setState(() {
                //       backgroundColor = color;
                //     });
                //   },
                //   showLabel: false,
                //   pickerAreaHeightPercent: 0.8,
                // ),
              ],
            ),
            actions: [
              TextButton(
                child: Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('SAVE'),
                onPressed: () {
                  // TODO: Save settings
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
      },
    );
  }
}
