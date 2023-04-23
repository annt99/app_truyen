import 'package:app_truyen/app/di.dart';
import 'package:app_truyen/domain/model/category_model.dart';
import 'package:app_truyen/presentation/main/home_page/cubit/home_page_cubit.dart';
import 'package:app_truyen/core/state_renderer/state_render_impl.dart';
import 'package:app_truyen/utils/color_manager.dart';
import 'package:app_truyen/utils/font_manager.dart';
import 'package:app_truyen/utils/route_manager.dart';
import 'package:app_truyen/utils/string_manager.dart';
import 'package:app_truyen/utils/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageCubit>(
      create: (context) => HomePageCubit(instance())..getCategories(),
      child: Column(
        children: [
          tabbar(),
          Expanded(
            child: BlocBuilder<HomePageCubit, HomePageState>(
              builder: (context, state) {
                List<Category> categories = [];
                _tabController.addListener(() {
                  switch (_tabController.index) {
                    case 0:
                      context.read<HomePageCubit>().getCategories();
                      break;
                    default:
                      break;
                  }
                });
                if (state is HomePageLoaded) {
                  categories = state.categories;
                  return _getContentWidget(categories);
                } else {
                  return state.getScreenWidget(
                      context,
                      _getContentWidget(categories),
                      () => instance<HomePageCubit>().getCategories());
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Container tabbar() {
    return Container(
      color: ColorManager.white,
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        labelColor: ColorManager.primary,
        labelStyle: getBoldStyle(color: ColorManager.primary, fontSize: 16),
        tabs: const [
          Tab(
            text: AppString.category,
          ),
          Tab(
            text: AppString.update,
          ),
          Tab(
            text: AppString.isFull,
          ),
          Tab(
            text: AppString.yourStories,
          ),
        ],
      ),
    );
  }

  Widget _getContentWidget(List<Category> categories) {
    return TabBarView(
      controller: _tabController,
      children: [
        GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            children: categories
                .map((category) => GestureDetector(
                      onTap: () {
                        Map<String, dynamic> params = {
                          "categoryName": category.name,
                          "categoryId": category.id
                        };
                        Navigator.of(context)
                            .pushNamed(Routes.stories, arguments: params);
                      },
                      child: GridTile(
                          child: Container(
                        margin: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: ColorManager.lightGray,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          category.name,
                          style: getMediumStyle(
                              color: Colors.black,
                              fontSize: FontSizeManager.s16),
                        ),
                      )),
                    ))
                .toList()),
        const Center(
          child: Text(AppString.update),
        ),
        const Center(
          child: Text(AppString.isFull),
        ),
        const Center(
          child: Text(AppString.yourStories),
        ),
      ],
    );
  }
}
