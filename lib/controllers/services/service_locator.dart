import 'package:get_it/get_it.dart';
import 'package:pp_17/data/database/data_base.dart';

class ServiceLocator {
  final _getIt = GetIt.instance;

  Future<void> setup() async {
    final dataBase = DataBase();
    _getIt.registerSingleton<DataBase>(dataBase);
    await dataBase.init();
  }
}