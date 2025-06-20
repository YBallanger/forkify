import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forkify/res/fonts.dart';
import 'package:forkify/view/feature/addUserVisit/star_rating.widget.dart';

class AddUserVisitForm extends StatelessWidget {
  const AddUserVisitForm({
    super.key,
    required this.formKey,
    required this.restaurantNameController,
    required this.priceController,
    required this.rating,
    required this.onRatingChanged,
    required this.onSubmit,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController restaurantNameController;
  final TextEditingController priceController;
  final double rating;
  final ValueChanged<double> onRatingChanged;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Text(
            "Ajout d'une nouvelle expérience",
            textAlign: TextAlign.center,
            style: Fonts.titleMedium
                .apply(color: Theme.of(context).colorScheme.onSurface),
          ),
          Expanded(
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  const Spacer(
                    flex: 1,
                  ),
                  TextFormField(
                    controller: restaurantNameController,
                    decoration: const InputDecoration(
                      labelText: 'Nom du restaurant',
                      prefixIcon: Icon(Icons.restaurant),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Le restaurant ne doit pas être vide';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: priceController,
                    decoration: const InputDecoration(
                      labelText: 'Prix du repas',
                      prefixIcon: Icon(Icons.euro),
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*,?\d{0,2}$')),
                    ],
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez saisir le prix';
                      }
                      String normalizedValue = value.replaceAll(',', '.');
                      if (double.tryParse(normalizedValue) == null) {
                        return 'Veuillez saisir un prix valide';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  StarRating(
                    rating: rating,
                    onRatingChanged: onRatingChanged,
                    size: 50,
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: onSubmit,
                      child: Text(
                        "Valider",
                        textAlign: TextAlign.center,
                        style: Fonts.subtitleMedium.apply(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
