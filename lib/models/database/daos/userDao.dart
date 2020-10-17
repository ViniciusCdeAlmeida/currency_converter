import 'package:currency_converter/models/database/databaseMoor.dart';
import 'package:currency_converter/models/serialized/user.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'userDao.g.dart';

@UseDao(tables: [UserDB])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  final AppDatabase db;

  UserDao(this.db) : super(db);

  Future<UserDBData> getUser(User user) => (select(db.userDB)
        ..where(
          (tbl) =>
              tbl.userName.equals(user.userName) &
              tbl.password.equals(user.password),
        ))
      .getSingle();

  Future<void> insertUser(User user) async {
    into(userDB).insert(
      UserDBCompanion(
        password: Value(user.password),
        userName: Value(user.userName),
      ),
    );
  }
}
