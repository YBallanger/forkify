import 'package:flutter/material.dart';
import 'package:forkify/view/feature/addUserVisit/add_user_visit.feature.dart';
import 'package:forkify/view/feature/someStatsCard/some_stats_card.feature.dart';
import 'package:forkify/view/feature/topAdresses/top_addresses.feature.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
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
          child: Padding(padding: EdgeInsets.all(20.0), child: AddUserVisit()),
        )
      ],
    );
  }
}
