import 'package:flutter/material.dart';
import 'package:forkify/view/feature/someStatsCard/some_stats_card.feature.dart';
import 'package:forkify/view/feature/topAdresses/top_addresses.feature.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TopAddresses(),
            SizedBox(height: 20,),
            SomeStatsCard()
          ],
        ),
      ),
    );
  }
}
