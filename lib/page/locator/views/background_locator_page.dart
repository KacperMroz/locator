import 'package:flutter/material.dart';
import 'package:locator/page/locator/views/background_locator_view.dart';

import '../../../theme/app_colors.dart';
import '../../../widgets/background_view.dart';
import '../../../widgets/custom_app_bar.dart';

class BackgroundLocatorPage extends StatelessWidget {
  const BackgroundLocatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GradientBackgroundView(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Scaffold(
              backgroundColor: AppColors.transparent,
              appBar: CustomAppBar(
                label: 'Lokalizator',
                brightness: 'dark',
                onBackPressed: () {},
                isMenuNeeded: false,
              ),
              body: const BackgroundLocatorView()),
        ),
      ),
    );
  }
}
