import 'package:flutter/material.dart';

import 'half_clipper.widget.dart';

class StarRating extends StatelessWidget {
  const StarRating({
    super.key,
    required this.rating,
    required this.onRatingChanged,
    this.size = 30,
    this.activeColor = Colors.amber,
    this.inactiveColor = Colors.grey,
  });
  final double rating;
  final ValueChanged<double> onRatingChanged;
  final double size;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List<Widget>.generate(5, (int index) {
        return GestureDetector(
          onTapDown: (TapDownDetails details) {
            final RenderBox box = context.findRenderObject() as RenderBox;
            final Offset localPosition =
                box.globalToLocal(details.globalPosition);
            final double starWidth = size;
            final int starIndex = (localPosition.dx / starWidth).floor();
            final double positionInStar =
                (localPosition.dx % starWidth) / starWidth;

            double newRating;
            if (positionInStar < 0.5) {
              newRating = starIndex + 0.5;
            } else {
              newRating = starIndex + 1.0;
            }

            newRating = newRating.clamp(0.0, 5.0);

            if (newRating == rating) {
              newRating = 0.0;
            }

            onRatingChanged(newRating);
          },
          child: Container(
            width: size,
            height: size,
            padding: const EdgeInsets.all(2),
            child: _buildStar(index + 1),
          ),
        );
      }),
    );
  }

  Widget _buildStar(int position) {
    if (rating >= position) {
      return Icon(
        Icons.star,
        size: size - 4,
        color: activeColor,
      );
    } else if (rating >= position - 0.5) {
      return Stack(
        children: [
          Icon(
            Icons.star_border,
            size: size - 4,
            color: inactiveColor,
          ),
          ClipRect(
            clipper: HalfClipper(),
            child: Icon(
              Icons.star,
              size: size - 4,
              color: activeColor,
            ),
          ),
        ],
      );
    } else {
      return Icon(
        Icons.star_border,
        size: size - 4,
        color: inactiveColor,
      );
    }
  }
}
