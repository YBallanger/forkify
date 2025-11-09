import 'package:flutter/material.dart';
import 'package:forkify/res/fonts.dart';
import 'package:forkify/utils/shimmers/text_shimmer.utils.dart';
import 'package:forkify/view/feature/someStatsCard/some_stats_card_item.widget.dart';
import 'package:forkify/viewModel/user_statistics.view_model.dart';
import 'package:provider/provider.dart';

class SomeStatsCard extends StatefulWidget {
  const SomeStatsCard({super.key});

  @override
  State<SomeStatsCard> createState() => _SomeStatsCardState();
}

class _SomeStatsCardState extends State<SomeStatsCard>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final UserStatisticsViewModel userStatisticsViewModel =
        Provider.of<UserStatisticsViewModel>(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Quelques statistiques',
            style: Fonts.titleMedium
                .apply(color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
          const SizedBox(height: 20),
          SomeStatsCardItem(
            iconPath: 'asset/someStats/dollar-pig.svg',
            content: userStatisticsViewModel.isLoading
                ? const TextShimmer()
                : RichText(
                    text: TextSpan(
                      style: Fonts.bodyMedium.apply(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                      children: <TextSpan>[
                        const TextSpan(text: 'Vous avez dépensé '),
                        TextSpan(
                            text:
                                "${userStatisticsViewModel.userStatistics?.amountSpent.toStringAsFixed(2) ?? '0.00'} €",
                            style: Fonts.boldBodyMedium),
                        const TextSpan(text: ' en restaurant !'),
                      ],
                    ),
                  ),
          ),
          const SizedBox(height: 20),
          SomeStatsCardItem(
            iconPath: 'asset/someStats/location-pin.svg',
            content: userStatisticsViewModel.isLoading
                ? const TextShimmer()
                : RichText(
                    text: TextSpan(
                      style: Fonts.bodyMedium.apply(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                      children: <TextSpan>[
                        const TextSpan(text: 'Vous avez mangé '),
                        TextSpan(
                            text:
                                '${userStatisticsViewModel.userStatistics?.numberOfVisits ?? 0}',
                            style: Fonts.boldBodyMedium),
                        const TextSpan(text: ' fois dans des restaurants !'),
                      ],
                    ),
                  ),
          ),
          const SizedBox(height: 20),
          SomeStatsCardItem(
            iconPath: 'asset/someStats/compass.svg',
            content: userStatisticsViewModel.isLoading
                ? const TextShimmer()
                : RichText(
                    text: TextSpan(
                      style: Fonts.bodyMedium.apply(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                      children: <TextSpan>[
                        const TextSpan(text: 'Vous êtes allé dans '),
                        TextSpan(
                            text:
                                '${userStatisticsViewModel.userStatistics?.numberOfNewRestaurants ?? 0}',
                            style: Fonts.boldBodyMedium),
                        const TextSpan(text: ' restaurants différents !'),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
