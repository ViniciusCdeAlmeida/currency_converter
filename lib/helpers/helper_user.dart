import 'package:currency_converter/models/database/databaseMoor.dart';
import 'package:currency_converter/models/serialized/user.dart';

User helperUser(UserDBData user) {
  return User(
    id: user.id,
    password: user.password,
    userName: user.userName,
  );
}
