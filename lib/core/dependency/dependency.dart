import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'dependency.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async => await sl.init();

final providerList = <BlocProvider>[
];
