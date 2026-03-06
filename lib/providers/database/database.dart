import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toneharbor/init/initialized.dart';
import 'package:toneharbor/models/database/database.dart';

part 'database.g.dart';

@keepAlive
AppDatabase appDatabase(Ref ref) {
  final database = AppDatabase();
  ref.onDispose(() {
    database.close();
  });
  return database;
}
