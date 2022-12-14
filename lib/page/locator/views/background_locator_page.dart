import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locator/app/injection.dart';
import 'package:locator/page/locator/cubit/locator_cubit.dart';
import 'package:locator/page/locator/views/background_locator_view.dart';
import 'package:locator/page/splash.dart';

import '../../../theme/app_colors.dart';
import '../../../widgets/background_view.dart';
import '../../../widgets/custom_app_bar.dart';

class BackgroundLocatorPage extends StatelessWidget {
  const BackgroundLocatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocatorCubit()..initialize(),
      child: MaterialApp(
        home: Scaffold(
          floatingActionButton: ElevatedButton(
            child: Text('Stop'),
            onPressed: (){
              getIt.get<LocatorCubit>().stopService();
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => SplashPage()
                ),
              );
            },
          ),
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
      ),
    );
  }
}
