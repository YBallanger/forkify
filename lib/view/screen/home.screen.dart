import 'package:flutter/material.dart';
import 'package:forkify/res/fonts.dart';
import 'package:forkify/view/feature/someStatsCard/some_stats_card.feature.dart';
import 'package:forkify/view/feature/topAdresses/top_addresses.feature.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TopAddresses(),
                SizedBox(
                  height: 20,
                ),
                SomeStatsCard(),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 50,
              child: FilledButton.icon(
                onPressed: () => {},
                icon: Icon(
                  Icons.add_circle_outline,
                  size: 25,
                ),
                label: Text(
                  "Ajouter une expérience",
                  style: Fonts.bodyLarge,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
