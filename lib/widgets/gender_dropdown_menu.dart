import 'package:flutter/material.dart';

import '../data/registration_data.dart';

class GenderDropDownMenu extends StatelessWidget {
  final Widget icon;
  final String txt;
  final void Function(String?) onSelected;
  const GenderDropDownMenu({
    super.key,
    required this.onSelected,
    required this.icon,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      expandedInsets: EdgeInsets.all(40),
      label: Text(txt),
      onSelected: onSelected,
      leadingIcon: Icon(Icons.info),
      selectedTrailingIcon: icon,
      dropdownMenuEntries:
          genderList
              .map(
                (e) => DropdownMenuEntry(
                  value: e.id,
                  leadingIcon: Icon(e.icon),
                  label: e.title,
                ),
              )
              .toList(),
    );
  }
}
