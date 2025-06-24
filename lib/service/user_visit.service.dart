import 'package:forkify/data/network/network_api.service.dart';
import 'package:forkify/model/user_visit_create.model.dart';

class UserVisitService {
  Future<void> createUserVisit(UserVisitCreateModel userVisitCreateDTO) async {
    try {
      await ApiServices().postApi("/user/visits", userVisitCreateDTO.toMap());
    } catch (e) {
      rethrow;
    }
  }
}
