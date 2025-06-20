import 'package:flutter/material.dart';
import 'package:forkify/model/dto/user_visit_create.dto.dart';
import 'package:forkify/res/fonts.dart';
import 'package:forkify/view/feature/addUserVisit/add_user_visit_form.widget.dart';
import 'package:forkify/viewModel/authentication.view_model.dart';
import 'package:forkify/viewModel/user_visit_view_model.dart';

class AddUserVisit extends StatefulWidget {
  const AddUserVisit({super.key});

  @override
  State<AddUserVisit> createState() => _AddUserVisitState();
}

class _AddUserVisitState extends State<AddUserVisit> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _restaurantNameController =
      TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  void handleSubmit(double rating) {
    if (_formKey.currentState?.validate() ?? false) {
      final String restaurantName = _restaurantNameController.text;
      final String priceText = _priceController.text.replaceAll(',', '.');
      final double price = double.parse(priceText);

      UserVisitCreateDTO userVisitCreateDTO = UserVisitCreateDTO(
          userId: AuthenticationViewModel().currentUser!.uid,
          restaurantName: restaurantName,
          amountSpent: price,
          rating: rating);
      UserVisitViewModel().createUserVisit(userVisitCreateDTO);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Expérience ajoutée avec succès !'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez corriger les erreurs du formulaire'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: FilledButton.icon(
        onPressed: () => showModalBottomSheet(
          context: context,
          useRootNavigator: true,
          constraints: const BoxConstraints.expand(),
          backgroundColor: Theme.of(context).colorScheme.surface,
          builder: (BuildContext builder) {
            double rating = 0.0;
            return StatefulBuilder(
                builder: (BuildContext context, StateSetter setModalState) {
              return AddUserVisitForm(
                formKey: _formKey,
                restaurantNameController: _restaurantNameController,
                priceController: _priceController,
                rating: rating,
                onRatingChanged: (double newRating) => setModalState(() {
                  rating = newRating;
                }),
                onSubmit: () => handleSubmit(rating),
              );
            });
          },
        ),
        icon: const Icon(
          Icons.add_circle_outline,
          size: 25,
        ),
        label: Text(
          'Ajouter une expérience',
          style: Fonts.bodyLarge,
        ),
      ),
    );
  }
}
