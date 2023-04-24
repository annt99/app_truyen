import 'package:app_truyen/presentation/main/home_page/home_page.dart';
import 'package:app_truyen/utils/color_manager.dart';
import 'package:app_truyen/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<Widget> pages = [
    const HomePage(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];
  final List<String> _titles = const [
    AppString.home,
    AppString.search,
    AppString.favorite,
    AppString.community,
    AppString.setting,
  ];
  var _title = AppString.home;
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
          title: Text(
        _title,
        style: Theme.of(context).textTheme.displaySmall,
      )),
      body: pages[_currentIndex],
      bottomNavigationBar: bottomNav(),
    );
  }

  SizedBox bottomNav() {
    return SizedBox(
      height: 100,
      child: BottomNavigationBar(
        elevation: 10,
        selectedFontSize: 12,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
              icon: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 30,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _currentIndex == 0
                            ? ColorManager.primaryOpacity70
                            : ColorManager.white),
                  ),
                  const Icon(Icons.home_outlined, color: Colors.black)
                ],
              ),
              label: AppString.home),
          BottomNavigationBarItem(
              icon: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 30,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _currentIndex == 1
                            ? ColorManager.primaryOpacity70
                            : ColorManager.white),
                  ),
                  const Icon(Icons.search_outlined, color: Colors.black)
                ],
              ),
              label: AppString.search),
          BottomNavigationBarItem(
              icon: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 30,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _currentIndex == 2
                            ? ColorManager.primaryOpacity70
                            : ColorManager.white),
                  ),
                  const Icon(Icons.shelves, color: Colors.black)
                ],
              ),
              label: AppString.favorite),
          BottomNavigationBarItem(
              icon: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 30,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _currentIndex == 3
                            ? ColorManager.primaryOpacity70
                            : ColorManager.white),
                  ),
                  const Icon(Icons.forum_outlined, color: Colors.black)
                ],
              ),
              label: AppString.community),
          BottomNavigationBarItem(
              icon: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 30,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _currentIndex == 4
                            ? ColorManager.primaryOpacity70
                            : ColorManager.white),
                  ),
                  const Icon(Icons.settings_outlined, color: Colors.black)
                ],
              ),
              label: AppString.setting),
        ],
      ),
    );
  }

  void onTap(int value) {
    setState(() {
      _currentIndex = value;
      _title = _titles[value];
    });
  }
}
