import 'package:app_truyen/app/di.dart';
import 'package:app_truyen/core/functions.dart';
import 'package:app_truyen/domain/model/story_model.dart';
import 'package:app_truyen/domain/usecase/get_stories_usecase.dart';
import 'package:app_truyen/presentation/list_stories/cubit/stories_cubit.dart';
import 'package:app_truyen/core/state_renderer/state_render_impl.dart';
import 'package:app_truyen/utils/color_manager.dart';
import 'package:app_truyen/utils/font_manager.dart';
import 'package:app_truyen/utils/route_manager.dart';
import 'package:app_truyen/utils/styles_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class StoriesView extends StatefulWidget {
  const StoriesView(
      {super.key, required this.categoryid, required this.categoryName});
  final int categoryid;
  final String categoryName;
  @override
  State<StoriesView> createState() => _StoriesViewState();
}

class _StoriesViewState extends State<StoriesView> {
  final _scrollController = ScrollController();
  List<Story> stories = [];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
          foregroundColor: ColorManager.primary,
          title: Text(
            widget.categoryName,
            style: Theme.of(context).textTheme.displaySmall,
          )),
      body: BlocProvider<ListStoriesCubit>(
          create: (context) =>
              ListStoriesCubit(instance<GetStoriesUsecase>(), widget.categoryid)
                ..getStoriesById(),
          child: BlocConsumer<ListStoriesCubit, ListStoriesState>(
            listener: (context, state) {
              if (state is ListStoriesLoaded) {
                stories.addAll(state.stories);
              }
            },
            builder: (context, state) {
              _scrollController.addListener(() {
                if (_scrollController.offset >=
                        _scrollController.position.maxScrollExtent &&
                    !_scrollController.position.outOfRange) {
                  context.read<ListStoriesCubit>().loadMoreStoriesById();
                }
              });
              return state.getScreenWidget(context, _getContentWidget(stories),
                  () => instance<ListStoriesCubit>().getStoriesById());
            },
          )),
    );
  }

  _getContentWidget(List<Story> stories) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: stories.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.of(context)
            .pushNamed(Routes.storyDetail, arguments: stories[index]),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: ColorManager.lightGray,
              borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      CachedNetworkImageProvider(stories[index].poster),
                ),
                title: Text(
                  stories[index].title,
                  style: getBoldStyle(
                      color: Colors.black, fontSize: FontSizeManager.s16),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stories[index].author,
                      style: getMediumStyle(color: Colors.grey),
                    ),
                    Text(
                      stories[index].status,
                      style: getMediumStyle(color: Colors.grey),
                    ),
                    Text(
                      convertToDateTime(stories[index].updatedDate),
                      style: getMediumStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              if (stories[index].status == "Full")
                Positioned(
                    left: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 2),
                      color: const Color.fromARGB(255, 143, 14, 5),
                      transform: Matrix4.rotationZ(-45 * 0.0174533),
                      child: Text(
                        "Full",
                        style: getMediumStyle(color: Colors.white),
                      ),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
