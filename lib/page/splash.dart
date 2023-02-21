import 'package:flutter/material.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;
import 'package:locator/page/locator/views/background_locator_page.dart';
import 'package:locator/theme/app_text_styles.dart';

import '../widgets/buttons/rounded_button.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    bg.BackgroundGeolocation.ready(
      bg.Config(
        notification: bg.Notification(
          title: "Pobieranie lokalizacji",
          text: '',
        ),
        reset: true,
        debug: false,
        logLevel: bg.Config.LOG_LEVEL_ERROR,
        desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
        distanceFilter: 5.0,
        stopOnTerminate: false,
        startOnBoot: true,
        enableHeadless: true,
      ),
    ).then((bg.State state) {
      if (!state.enabled) {
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => const BackgroundLocatorPage()),
        );
      }
    }).catchError((error) {
      debugPrint('[ready] ERROR: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lokalizator',
          style: AppTextStyles.toolbarLabel('dark'),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          child: Card(
            elevation: 5,
            color: Colors.grey,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 60,
                  ),
                  const Text(
                    'Aplikacja pobiera lokalizacje użytkownika',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: RoundedButton(
                      onPressed: _onGoToLocationPressed,
                      label: 'Kontynuuj',
                    ),
                  ),
                ]
                    .expand(
                      (element) => [
                        element,
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Route _buildRoute(BuildContext context, Object? params) {
    return MaterialPageRoute<void>(
      builder: (BuildContext context) => const BackgroundLocatorPage(),
    );
  }

  void _onGoToLocationPressed() =>
      Navigator.restorablePush(context, _buildRoute);
}
