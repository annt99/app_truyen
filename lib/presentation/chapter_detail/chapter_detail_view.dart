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
  int brightnessValue = 50;
  double fontSizeValue = 1;
  Color backgroundColor = Colors.white;
  Color textColor = Colors.black;
  String fontFamily = FontConstants.fontMontserrat;

  @override
  Widget build(BuildContext context) {
    _currentPage = widget.chapters.indexOf(widget.chapter);
    _controller = PageController(initialPage: _currentPage);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
        backgroundColor: backgroundColor,
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
                    style: getMediumStyle(
                        color: backgroundColor == Colors.white
                            ? Colors.black
                            : Colors.white,
                        fontSize: 10 * fontSizeValue),
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
                            color: backgroundColor == Colors.white
                                ? const Color.fromARGB(255, 0, 97, 3)
                                : const Color.fromARGB(255, 90, 250, 95),
                            fontSize: FontSizeManager.s20 * fontSizeValue),
                      ),
                    ),
                    Html(
                      data: chapterDetail.toString(),
                      style: {
                        "p": Style(
                            color: backgroundColor == Colors.white
                                ? Colors.black
                                : Colors.white,
                            fontFamily: fontFamily,
                            fontSize: FontSize(14 * fontSizeValue))
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateScreen(double fontSize, Color color, String font) {
    setState(() {
      fontSizeValue = fontSize;
      backgroundColor = color;
      fontFamily = font;
    });
  }

  _showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, mySetState) {
          return AlertDialog(
            title: const Text('Cài đặt'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Phông chữ',
                  style: getMediumStyle(
                      color: Colors.black, fontSize: FontSizeManager.s14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio(
                          value: FontConstants.fontMontserrat,
                          groupValue: fontFamily,
                          onChanged: (value) {
                            mySetState(() {
                              fontFamily = value!;
                            });
                          },
                        ),
                        Text(FontConstants.fontMontserrat,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 11)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio(
                          value: FontConstants.fontOpensans,
                          groupValue: fontFamily,
                          onChanged: (value) {
                            mySetState(() {
                              fontFamily = value!;
                            });
                          },
                        ),
                        Text(FontConstants.fontOpensans,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 11)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio(
                          value: FontConstants.fontRoboto,
                          groupValue: fontFamily,
                          onChanged: (value) {
                            mySetState(() {
                              fontFamily = value!;
                            });
                          },
                        ),
                        Text(FontConstants.fontRoboto,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 11)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Kích thước chữ',
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
                Text('Màu nền',
                    style: getMediumStyle(
                        color: Colors.black, fontSize: FontSizeManager.s14)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio(
                          value: Colors.white,
                          groupValue: backgroundColor,
                          onChanged: (value) {
                            mySetState(() {
                              backgroundColor = value!;
                            });
                          },
                        ),
                        const Text("Light",
                            style:
                                TextStyle(color: Colors.black, fontSize: 11)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio(
                          value: Colors.black,
                          groupValue: backgroundColor,
                          onChanged: (value) {
                            mySetState(() {
                              backgroundColor = value!;
                            });
                          },
                        ),
                        const Text("Dark",
                            style:
                                TextStyle(color: Colors.black, fontSize: 11)),
                      ],
                    )
                  ],
                ),
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
                child: const Text('Hủy'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Lưu'),
                onPressed: () {
                  _updateScreen(fontSizeValue, backgroundColor, fontFamily);
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
