import 'package:flutter/material.dart';
import 'package:locator/page/home_page.dart';
import 'package:locator/widgets/buttons/rounded_button.dart';

import '../../../app/injection.dart';
import '../cubit/locator_cubit.dart';

class LocationContentColumn extends StatelessWidget {
  const LocationContentColumn({
    required this.motionActivity,
    required this.odometer,
    required this.content,
    required this.isInSpecificArea,
    required this.latitude,
    required this.longitude,
    required this.speed,
    required this.uuid,
    required this.imei,
    Key? key,
  }) : super(key: key);

  final String? motionActivity;
  final String? odometer;
  final String? content;
  final bool? isInSpecificArea;
  final double? latitude;
  final double? longitude;
  final double? speed;
  final String? uuid;
  final String? imei;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            'Jesteś w wyznaczonym miejscu: ${isInSpecificArea == true ? 'Tak' : 'Nie'}'),
        Text('Współrzędne: $latitude $longitude'),
        Text('Ostatnia prędkość: $speed'),
        Text('Id: $uuid'),
        Text('Aktywność ruchowa:$motionActivity '),
        Text('Przebyty dystans: $odometer km'),
        Text('IMEI: $imei'),
        RoundedButton(
          label: 'Zgłoś',
          onPressed: () {
            getIt.get<LocatorCubit>().stopService();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
            getIt.resetLazySingleton<LocatorCubit>();
          },
        ),
      ]
          .expand(
            (element) => [
              element,
              const SizedBox(
                height: 13,
              ),
            ],
          )
          .toList(),
    );
  }
}
