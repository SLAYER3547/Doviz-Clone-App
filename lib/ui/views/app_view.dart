import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppView extends StatelessWidget {
  const AppView({required this.navigationShell, super.key});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateTextStyle.resolveWith(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(color: Colors.white);
              } else {
                return const TextStyle(color: Colors.grey);
              }
            },
          ),
        ),
        child: NavigationBar(
          backgroundColor: Colors.black,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: navigationShell.goBranch,
          indicatorColor: Colors.transparent,
          destinations: [
            _menuItem(
              index: 0,
              currentIndex: navigationShell.currentIndex,
              label: 'Ana Sayfa',
              icon: Icons.home,
            ),
            _menuItem(
              index: 1,
              currentIndex: navigationShell.currentIndex,
              label: 'Haberler',
              icon: Icons.newspaper,
            ),
            _menuItem(
              index: 2,
              currentIndex: navigationShell.currentIndex,
              label: 'Piyasalar',
              icon: Icons.trending_up,
            ),
            _menuItem(
              index: 3,
              currentIndex: navigationShell.currentIndex,
              label: 'Çevirici',
              icon: Icons.swap_horiz,
            ),
            _menuItem(
              index: 4,
              currentIndex: navigationShell.currentIndex,
              label: 'Menü',
              icon: Icons.menu,
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem({
    required int index,
    required int currentIndex,
    required String label,
    required IconData icon,
  }) {
    return NavigationDestination(
      icon: Icon(
        icon,
        color: currentIndex == index ? Colors.white : Colors.grey,
      ),
      label: label,
    );
  }
}
