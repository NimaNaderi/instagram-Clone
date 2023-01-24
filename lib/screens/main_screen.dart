import 'package:flutter/material.dart';
import 'package:instagram/screens/activity_screen.dart';
import 'package:instagram/screens/add_content_screen.dart';
import 'package:instagram/screens/home_screen.dart';
import 'package:instagram/screens/search_screen.dart';
import 'package:instagram/screens/user_pofile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedBottomNavigationItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xff1C1F2E),
          currentIndex: _selectedBottomNavigationItem,
          onTap: (int index) {
            setState(() {
              _selectedBottomNavigationItem = index;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('images/icon_home.png'),
              activeIcon: Image.asset('images/icon_active_home.png'),
              label: 'Item1',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/icon_search_navigation.png'),
              activeIcon:
                  Image.asset('images/icon_search_navigation_active.png'),
              label: 'Item2',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/icon_add_navigation.png'),
              activeIcon: Image.asset('images/icon_add_navigation_active.png'),
              label: 'Item3',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/icon_activity_navigation.png'),
              activeIcon:
                  Image.asset('images/icon_activity_navigation_active.png'),
              label: 'Item4',
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Color(0xffC5C5C5),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: FittedBox(
                    child: Image.asset('images/profile.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              activeIcon: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Color(0xffF35383),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: FittedBox(
                    child: Image.asset('images/profile.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              label: 'Item5',
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedBottomNavigationItem,
        children: getLayout(),
      ),
    );
  }

  List<Widget> getLayout() {
    return <Widget>[
      HomeScreen(),
      SearchScreen(),
      AddContentScreen(),
      ActivityScreen(),
      UserProfileScreen(),
    ];
  }
}
