import 'package:flutter/material.dart';

import '../theme/color.dart';
import 'custom_icon.dart';

class CustomNavigatorDestination extends StatelessWidget {
  final String label;
  final IconData icon;

  const CustomNavigatorDestination({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColor = theme.extension<CustomColor>()!;
    final inverseSurface = theme.colorScheme.inverseSurface;
    return NavigationDestination(
      icon: CustomIcon(icon: icon, color: inverseSurface),
      selectedIcon: CustomIcon(icon: icon, color: customColor.redShade),
      label: label,
    );
  }
}
