import 'package:flutter/material.dart';
import 'package:lab52/screens/find_person_screen.dart';
import 'package:lab52/screens/liked_persons_screen.dart';
import 'package:lab52/screens/profile_screen.dart';
import '../app_routes.dart';
import 'later_persons_screen.dart';
import 'not_found_screen.dart';

typedef Routes = Map<String, Widget Function(BuildContext context)>;

class HomeNavigatorScreen extends StatefulWidget {
  const HomeNavigatorScreen({super.key});

  @override
  State<HomeNavigatorScreen> createState() => _HomeNavigatorScreenState();
}

class _HomeNavigatorScreenState extends State<HomeNavigatorScreen> {
  String? userGender;
  int selectedIndex = 2;

  MaterialPageRoute onGenerateRoute(Routes routes, RouteSettings settings) {
    final builder = routes[settings.name];
    if (builder != null) {
      return MaterialPageRoute(builder: builder, settings: settings);
    }
    return MaterialPageRoute(
      builder: (ctx) => NotFoundScreen(),
      settings: settings,
    );
  }

  void onDestinationSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> get navigatorScreens => [
    Navigator(
      initialRoute: AppRoutes.liked,
      onGenerateRoute:
          (settings) => onGenerateRoute({
            AppRoutes.liked: (ctx) => LikedPersonsScreen(),
          }, settings),
    ),
    Navigator(
      initialRoute: AppRoutes.later,
      onGenerateRoute:
          (settings) => onGenerateRoute({
            AppRoutes.later: (ctx) => LaterPersonsScreen(),
          }, settings),
    ),
    Navigator(
      initialRoute: AppRoutes.find,
      onGenerateRoute: (settings) {
        return onGenerateRoute({
          AppRoutes.find: (ctx) => FindPersonScreen(),
        }, settings);
      },
    ),
    Navigator(
      initialRoute: AppRoutes.profile,
      onGenerateRoute:
          (settings) => onGenerateRoute({
            AppRoutes.profile: (ctx) => ProfileScreen(),
          }, settings),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: navigatorScreens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: [
          NavigationDestination(icon: Icon(Icons.favorite), label: 'Fav'),
          NavigationDestination(icon: Icon(Icons.access_time), label: 'Later'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Find'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
