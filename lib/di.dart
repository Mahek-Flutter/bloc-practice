import 'package:get_it/get_it.dart';

import 'counter/counter_bloc.dart';
import 'home/home_bloc.dart';

final getIt = GetIt.instance;

void setupDI() {
  getIt.registerLazySingleton(() => HomeBloc());
  getIt.registerLazySingleton(() => CounterBloc());
}
