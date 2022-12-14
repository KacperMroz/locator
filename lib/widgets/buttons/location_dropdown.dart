import 'package:flutter/material.dart';
import 'package:locator/app/injection.dart';
import 'package:locator/page/locator/cubit/locator_cubit.dart';
import 'package:locator/theme/app_text_styles.dart';

import '../../theme/app_colors.dart';

class LocationDropdownButton extends StatefulWidget {
  const LocationDropdownButton({Key? key}) : super(key: key);

  @override
  LocationDropdownButtonState createState() => LocationDropdownButtonState();
}

class LocationDropdownButtonState extends State<LocationDropdownButton> {
  String dropdownValue = '';

  final items = [
    'A.Słonimskiego 6, Wrocław',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.black12,
      ),
      width: 280,
      height: 44,
      child: DropdownButtonFormField(
          iconEnabledColor: AppColors.black,
          iconSize: 25,
          isExpanded: true,
          hint: Text(
            'Wybierz placówkę',
            style: AppTextStyles.chooseRegion(),
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.location_on,
              size: 20,
              color: Colors.black,
            ),
          ),
          items: items.map((String item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
              getIt.get<LocatorCubit>().setLocation(dropdownValue);
            });
          }),
    );
  }
}
