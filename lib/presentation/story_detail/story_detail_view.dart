import 'package:app_truyen/app/di.dart';
import 'package:app_truyen/core/functions.dart';
import 'package:app_truyen/core/state_renderer/state_render_impl.dart';
import 'package:app_truyen/domain/model/chapter_model.dart';
import 'package:app_truyen/domain/model/story_model.dart';
import 'package:app_truyen/domain/usecase/get_chapter_usecase.dart';
import 'package:app_truyen/presentation/story_detail/cubit/story_detai_cubit.dart';
import 'package:app_truyen/utils/color_manager.dart';
import 'package:app_truyen/utils/font_manager.dart';
import 'package:app_truyen/utils/route_manager.dart';
import 'package:app_truyen/utils/styles_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryDetailView extends StatefulWidget {
  const StoryDetailView({super.key, required this.story});
  final Story story;

  @override
  State<StoryDetailView> createState() => _StoryDetailViewState();
}

class _StoryDetailViewState extends State<StoryDetailView> {
  List<Chapter> chapters = [];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return BlocProvider<StoryDetaiCubit>(
      create: (context) => StoryDetaiCubit(instance<GetChaptersUsecase>())
        ..getChapters(widget.story.slug),
      child: Scaffold(
        body: BlocConsumer<StoryDetaiCubit, StoryDetailState>(
          listener: (context, state) {
            if (state is StoryDetailLoaded) {
              chapters = state.chapters;
            }
          },
          builder: (context, state) {
            return state.getScreenWidget(
                context,
                _getContentWidget(context),
                () => context
                    .read<StoryDetaiCubit>()
                    .getChapters(widget.story.slug));
          },
        ),
      ),
    );
  }

  Widget posterSection() => Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: ColorManager.lightGray,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: CachedNetworkImageProvider(widget.story.poster),
            ),
            const SizedBox(height: 20),
            Text(
              widget.story.title,
              style: getBoldStyle(
                  color: Colors.black, fontSize: FontSizeManager.s20),
            )
          ],
        ),
      );
  Widget detailSection() => Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: ColorManager.lightGray,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tác giả: ${widget.story.author}",
              style: getMediumStyle(
                  color: Colors.black, fontSize: FontSizeManager.s14),
            ),
            const SizedBox(height: 5),
            Text(
              "Thể loại: ${listToString(widget.story.categoryList)}",
              style: getMediumStyle(
                  color: Colors.black, fontSize: FontSizeManager.s14),
            ),
            const SizedBox(height: 5),
            Text(
              "Trạng thái: ${widget.story.status}",
              style: getMediumStyle(
                  color: Colors.black, fontSize: FontSizeManager.s14),
            ),
            const SizedBox(height: 5),
            Text(
              "Đăng: ${convertToDate(widget.story.uploadDate)}",
              style: getMediumStyle(
                  color: Colors.black, fontSize: FontSizeManager.s14),
            ),
            const SizedBox(height: 5),
            Text(
              "Cập nhật: ${convertToDate(widget.story.updatedDate)}",
              style: getMediumStyle(
                  color: Colors.black, fontSize: FontSizeManager.s14),
            ),
          ],
        ),
      );

  Widget readButtonSection() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: ElevatedButton(
            onPressed: () {
              if (chapters.isNotEmpty) {
                final reversList = chapters.reversed.toList();
                final params = {
                  "chapters": reversList,
                  "chapter": reversList.first
                };
                Navigator.of(context)
                    .pushNamed(Routes.chapterDetail, arguments: params);
              }
            },
            child: Text(
              "Đọc truyện",
              style: getMediumStyle(
                  color: Colors.white, fontSize: FontSizeManager.s14),
            )),
      );
  Widget backButtonSection() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.lightGray,
                foregroundColor: ColorManager.primary),
            child: Text(
              "Quay lại",
              style: getMediumStyle(
                  color: ColorManager.primary, fontSize: FontSizeManager.s14),
            )),
      );
  Widget lastUpdatedChapter(BuildContext context) => Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: ColorManager.lightGray,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Row(
              children: [
                Text("Các chương mới nhất",
                    style: getBoldStyle(
                        color: Colors.black, fontSize: FontSizeManager.s14)),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(Routes.chapters, arguments: chapters);
                    },
                    child: Text("Xem tất cả",
                        style: getBoldStyle(
                            color: ColorManager.primary,
                            fontSize: FontSizeManager.s14))),
              ],
            ),
            if (chapters.isNotEmpty)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                    children: chapters
                        .sublist(0, chapters.length >= 5 ? 5 : chapters.length)
                        .map((chapter) => GestureDetector(
                              onTap: () {
                                final params = {
                                  "chapters": chapters.reversed.toList(),
                                  "chapter": chapter
                                };
                                Navigator.of(context).pushNamed(
                                    Routes.chapterDetail,
                                    arguments: params);
                              },
                              child: ListTile(
                                title: Text(
                                  chapter.header,
                                  style: getMediumStyle(
                                      color: Colors.black,
                                      fontSize: FontSizeManager.s14),
                                ),
                              ),
                            ))
                        .toList()),
              )
          ],
        ),
      );

  String listToString(List<String> list) {
    var listString = '';
    for (var item in list) {
      listString = '$listString, $item';
    }

    return listString.substring(2, listString.length);
  }

  _getContentWidget(BuildContext context) => ListView(
        children: [
          posterSection(),
          detailSection(),
          readButtonSection(),
          lastUpdatedChapter(context),
          backButtonSection()
        ],
      );
}
