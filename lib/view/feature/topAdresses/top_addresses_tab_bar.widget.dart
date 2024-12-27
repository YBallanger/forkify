import 'package:flutter/material.dart';
import 'package:forkify/res/fonts.dart';

class TopAddressesTabBar extends StatelessWidget {
  const TopAddressesTabBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      labelPadding: EdgeInsets.all(10),
      tabs: [
        Text(
          "Dépenses",
          style: Fonts.bodyMedium,
        ),
        Text("Notes", style: Fonts.bodyMedium),
        Text("Visites", style: Fonts.bodyMedium)
      ],
    );
  }
}
