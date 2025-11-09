import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SomeStatsCardItem extends StatelessWidget {
  const SomeStatsCardItem(
      {super.key, required this.iconPath, required this.content});

  final String iconPath;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SvgPicture.asset(
          iconPath,
          height: 45,
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(child: content)
      ],
    );
  }
}
