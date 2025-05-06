import 'package:flutter/material.dart';

import '../theme/color.dart';

class CustomText extends StatelessWidget {
  final String txt;
  const CustomText({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColor = theme.extension<CustomColor>()!;
    return Expanded(
      child: Text(
        txt,
        style: TextStyle(color: customColor.txtColor),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }
}
