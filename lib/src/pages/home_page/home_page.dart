import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  late WebViewController controller;
  double progress = 0;

  String url = 'https://alx-intranet.hbtn.io/';

  @override
  Widget build(final BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            (progress < 1)
                ? LinearProgressIndicator(
                    value: progress,
                    color: Colors.red,
                    backgroundColor: Colors.black,
                  )
                : const Center(),
            Expanded(
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                debuggingEnabled: true,
                initialUrl: url,
                onWebViewCreated: (final controller) =>
                    this.controller = controller,
                onProgress: (final progress) {
                  setState(() => this.progress = progress / 100);
                  if (progress > 30) {
                    controller.runJavascript(
                      "document.getElementsByTagName('nav')[0].remove();",
                    );
                    controller.runJavascript(
                      "document.getElementsByTagName('h1')[0].style.margin='0px'",
                    );
                    controller.runJavascript(
                      "document.getElementById('search-button').remove();",
                    );
                    controller.runJavascript(
                      "document.getElementsByClassName('copyright')[0].remove();",
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (final int index) {
          setState(() {
            _selectedIndex = index;
          });

          if (_selectedIndex == 0) {
            controller.loadUrl(url);
          } else if (_selectedIndex == 1) {
            controller.loadUrl('${url}planning/me');
          } else if (_selectedIndex == 2) {
            controller.loadUrl('${url}projects/current');
          } else if (_selectedIndex == 3) {
            controller.loadUrl('${url}concepts');
          } else if (_selectedIndex == 4) {
            controller.loadUrl('${url}users/my_profile');
          }
        },
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'My Planning',
            icon: Icon(
              Icons.calendar_month,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Projects',
            icon: Icon(
              Icons.commit,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Concepts',
            icon: Icon(
              Icons.book,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Icons.person,
            ),
          ),
        ],
      ),
    );
  }
}
