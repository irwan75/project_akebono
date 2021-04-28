import 'package:get_storage/get_storage.dart';

class StoragePreferences {
  final box = GetStorage();

  void saveUsername(String username) {
    box.write('username', username ?? "");
  }

  String getUsername() {
    return box.read('username') ?? "";
  }
}
