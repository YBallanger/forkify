import 'package:forkify/data/network/network_api.service.dart';
import 'package:forkify/model/dto/user_visit_create.dto.dart';

class UserVisitService {
  Future<void> createUserVisit(UserVisitCreateDTO userVisitCreateDTO) async {
    try {
      await ApiServices().postApi("/user/visits", userVisitCreateDTO.toMap());
    } catch (e) {
      rethrow;
    }
  }
}
