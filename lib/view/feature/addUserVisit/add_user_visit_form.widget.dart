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
    required this.isLoading,
    required this.onRatingChanged,
    required this.onSubmit,
    required this.restaurantSuggestions,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController restaurantNameController;
  final TextEditingController priceController;
  final double rating;
  final bool isLoading;
  final ValueChanged<double> onRatingChanged;
  final VoidCallback onSubmit;
  final List<String> restaurantSuggestions;

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
                  const Spacer(),
                  Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty) {
                        return const Iterable<String>.empty();
                      }
                      final String query = textEditingValue.text.toLowerCase();
                      return restaurantSuggestions.where((String option) {
                        return option.toLowerCase().contains(query);
                      });
                    },
                    onSelected: (String selection) {
                      restaurantNameController.text = selection;
                    },
                    fieldViewBuilder: (BuildContext context,
                        TextEditingController fieldTextEditingController,
                        FocusNode focusNode,
                        VoidCallback onFieldSubmitted) {
                      // Synchronisation initiale et continue entre les deux controllers
                      if (fieldTextEditingController.text !=
                          restaurantNameController.text) {
                        fieldTextEditingController.text =
                            restaurantNameController.text;
                        fieldTextEditingController.selection =
                            restaurantNameController.selection;
                      }
                      fieldTextEditingController.addListener(() {
                        if (restaurantNameController.text !=
                            fieldTextEditingController.text) {
                          restaurantNameController.text =
                              fieldTextEditingController.text;
                          restaurantNameController.selection =
                              fieldTextEditingController.selection;
                        }
                      });

                      return TextFormField(
                        controller: fieldTextEditingController,
                        focusNode: focusNode,
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
                      );
                    },
                    optionsViewBuilder: (BuildContext context,
                        AutocompleteOnSelected<String> onSelected,
                        Iterable<String> options) {
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          elevation: 4.0,
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxHeight: 200),
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: options.length,
                              itemBuilder: (BuildContext context, int index) {
                                final String option = options.elementAt(index);
                                return ListTile(
                                  title: Text(option),
                                  onTap: () {
                                    onSelected(option);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      );
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
                  isLoading
                      ? CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.primary,
                        )
                      : SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: onSubmit,
                            child: Text(
                              'Valider',
                              textAlign: TextAlign.center,
                              style: Fonts.subtitleMedium.apply(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
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
