import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forkify/res/fonts.dart';
import 'package:forkify/view/feature/someStatsCard/some_stats_card_item.widget.dart';

class SomeStatsCard extends StatefulWidget {
  const SomeStatsCard({super.key});

  @override
  State<SomeStatsCard> createState() => _SomeStatsCardState();
}

class _SomeStatsCardState extends State<SomeStatsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Quelques statistiques",
            style: Fonts.titleMedium,
          ),
          SizedBox(
            height: 20,
          ),
          SomeStatsCardItem(
            iconPath: "asset/someStats/dollar-pig.svg",
            content: RichText(
              text: TextSpan(
                style: Fonts.bodyMedium.apply(color: Theme.of(context).colorScheme.onPrimaryContainer),
                children: <TextSpan>[
                  TextSpan(text: "Vous avez dépensé "),
                  TextSpan(text: "2654,98 €", style: Fonts.boldBodyMedium),
                  TextSpan(text: " en restaurant !"),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SomeStatsCardItem(
            iconPath: "asset/someStats/location-pin.svg",
            content: RichText(
              text: TextSpan(
                style: Fonts.bodyMedium.apply(color: Theme.of(context).colorScheme.onPrimaryContainer),
                children: <TextSpan>[
                  TextSpan(text: "Vous avez mangé "),
                  TextSpan(text: "231", style: Fonts.boldBodyMedium),
                  TextSpan(text: " fois dans des restaurants !"),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SomeStatsCardItem(
            iconPath: "asset/someStats/compass.svg",
            content: RichText(
              text: TextSpan(
                style: Fonts.bodyMedium.apply(color: Theme.of(context).colorScheme.onPrimaryContainer),
                children: <TextSpan>[
                  TextSpan(text: "Vous avez découvert "),
                  TextSpan(text: "89", style: Fonts.boldBodyMedium),
                  TextSpan(text: " nouveaux restaurants !"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
