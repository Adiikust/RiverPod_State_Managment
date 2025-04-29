import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/profile_model.dart';

class FutureViewModel {
  static final getProfileData = FutureProvider.family<ProfileModel, int>(
    (ref, id) async {
      final UserService userService = UserService();
      return await userService.fetchUserById(id);
    },
  );
}

class UserService {
  Future<ProfileModel> fetchUserById(int id) async {
    await Future.delayed(const Duration(seconds: 2));
    if (id == 0) throw Exception('User not found');
    final data = {
      'id': id,
      'name': 'User $id',
      'email': 'user$id@example.com',
    };
    return ProfileModel.fromJson(data);
  }
}
