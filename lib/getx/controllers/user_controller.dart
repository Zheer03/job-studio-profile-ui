import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/helpers/get_storage_helper.dart';
import 'package:job_studio_profile_ui/models/user_model.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/widgets/snack_bar_widget.dart';

class UserController extends GetxController {
  static UserController get to => Get.find(tag: 'user');

  UserModel? user;

  @override
  void onReady() async {
    log('accounts: ${GetStorageHelper.readList(accountsKey)}');
    log('user: ${GetStorageHelper.readMap(userKey)}');
    final userMap = GetStorageHelper.readMap(userKey);

    if (userMap != null) {
      user = UserModel.fromJson(userMap);

      await GetStorageHelper.write(
        userKey,
        user?.toJson(),
      );
    }

    super.onReady();
  }

  Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    try {
      final List<dynamic> accounts =
          GetStorageHelper.readList(accountsKey) ?? [];
      log('accounts: $accounts');

      final account = accounts.firstWhereOrNull(
        (account) {
          final accountMap = json.decode(account);
          return accountMap['email'] == email &&
              accountMap['password'] == password;
        },
      );

      final bool credentialValid = account != null;

      if (credentialValid) {
        user = UserModel.fromJson(json.decode(account));

        await GetStorageHelper.write(
          userKey,
          user?.toJson(),
        );
      } else {
        throw Exception('Invalid Credentials');
      }

      log('UserController User: ${user?.toJson()}');

      log('accounts: $accounts');
      update();
      return user;
    } catch (e) {
      snackBarWidget(
        title: 'Error',
        message: 'Invalid Credentials',
        backgroundColor: AppColors.systemRed,
      );
    }
    update();
    return null;
  }

  Future<UserModel?> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      final List<dynamic> accounts =
          GetStorageHelper.readList(accountsKey) ?? [];
      log('accounts: $accounts');

      final existingAccount = accounts.firstWhereOrNull(
        (account) {
          final accountMap = json.decode(account);
          return accountMap['email'] == email;
        },
      );

      final bool emailAvailable = existingAccount == null;

      log('emailAvailable: $emailAvailable');

      if (emailAvailable) {
        user = UserModel(
          id: accounts.isNotEmpty ? accounts.length + 1 : 1,
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
        );
        accounts.add(json.encode(user?.toJson()));

        await GetStorageHelper.write(
          accountsKey,
          accounts,
        );

        await GetStorageHelper.write(
          userKey,
          user?.toJson(),
        );
      } else {
        throw Exception('This email is already in use');
      }

      log('UserController User: ${user?.toJson()}');

      log('accounts: $accounts');
      update();
      return user;
    } catch (e) {
      snackBarWidget(
        title: 'Error',
        message: 'This email is already in use',
        backgroundColor: AppColors.systemRed,
      );
    }
    update();
    return null;
  }

  Future<void> logout() async {
    await GetStorageHelper.remove(userKey);
    clear();
  }

  void clear() {
    user = null;
  }
}
