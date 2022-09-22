import 'package:flutter/material.dart';
import 'package:alx/src/pages/pages.dart';
import 'package:flutter/services.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(final BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return MaterialApp(
      restorationScopeId: 'app',
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      darkTheme:
          ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (final RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (final BuildContext context) {
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
            switch (routeSettings.name) {
              case HomePage.routeName:
              default:
                return const HomePage();
            }
          },
        );
      },
    );
  }
}
