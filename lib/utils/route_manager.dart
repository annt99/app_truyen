import 'package:app_truyen/app/di.dart';
import 'package:app_truyen/domain/model/chapter_detail_model.dart';
import 'package:app_truyen/domain/model/chapter_model.dart';
import 'package:app_truyen/domain/model/story_model.dart';
import 'package:app_truyen/presentation/chapter_detail/chapter_detail_view.dart';
import 'package:app_truyen/presentation/list_stories/list_stories_view.dart';
import 'package:app_truyen/presentation/main/main_view.dart';
import 'package:app_truyen/presentation/splash/splash_view.dart';
import 'package:app_truyen/presentation/story_detail/chapters_view.dart';
import 'package:app_truyen/presentation/story_detail/story_detail_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String main = "/main";
  static const String stories = "/stories";
  static const String storyDetail = "/storyDetail";
  static const String chapters = "/chapters";
  static const String chapterDetail = "/chapterDetail";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.main:
        initMainModule();
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.stories:
        initStoriesModule();
        Map<String, dynamic> params =
            routeSettings.arguments as Map<String, dynamic>;
        String categoryName = params["categoryName"];
        int categoryId = params["categoryId"];
        return MaterialPageRoute(
            builder: (_) => StoriesView(
                categoryName: categoryName, categoryid: categoryId));
      case Routes.storyDetail:
        initStoryDetailModule();
        Story story = routeSettings.arguments as Story;
        return MaterialPageRoute(builder: (_) => StoryDetailView(story: story));
      case Routes.chapters:
        List<Chapter> chapters = routeSettings.arguments as List<Chapter>;
        return MaterialPageRoute(
            builder: (_) => ChaptersView(chapters: chapters));
      case Routes.chapterDetail:
        initChapterDetailModule();
        Map<String, dynamic> params =
            routeSettings.arguments as Map<String, dynamic>;
        List<Chapter> chapters = params["chapters"];
        int index = params["index"];
        return MaterialPageRoute(
            builder: (_) =>
                ChapterDetailView(index: index, chapters: chapters));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: const Text("No Route Found")),
              body: const Center(child: Text("No Route Found")),
            ));
  }
}
