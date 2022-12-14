import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locator/app/injection.dart';
import 'package:locator/page/locator/cubit/locator_cubit.dart';

import '../widgets/buttons/location_dropdown.dart';
import '../widgets/buttons/rounded_button.dart';
import 'locator/views/background_locator_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _LocationState();
}

class _LocationState extends State<HomePage> {
  LocatorCubit _bloc = getIt.get<LocatorCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocatorCubit, LocatorState>(
      bloc: _bloc,
      builder: (context, state) {
        return Scaffold(
            body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LocationDropdownButton(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: RoundedButton(
                  onPressed: _bloc.state.location == ''
                      ? _errorSnackBar
                      : _onGoToLocationPressed,
                  label: 'Kontynuuj',
                ),
              ),
            ]
                .expand(
                  (element) => [
                    element,
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                )
                .toList(),
          ),
        ));
      },
    );
  }

  static Route _buildRoute(BuildContext context, Object? params) {
    return MaterialPageRoute<void>(
      builder: (BuildContext context) => const BackgroundLocatorPage(),
    );
  }

  void _onGoToLocationPressed() =>
      Navigator.restorablePush(context, _buildRoute);

  void _errorSnackBar() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.fixed,
          duration: Duration(seconds: 2),
          content: Text('Wybierz lokalizacje'),
        ),
      );
  }
}
