import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:taskly/app.dart';
import 'package:taskly/core/dependency/dependency.dart';
import 'package:taskly/features/home_page/data/model/taskly_response_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  await Hive.initFlutter();
  Hive.registerAdapter(TasklyResponseModelAdapter());
  // await Hive.openBox<TasklyResponseModel>('task');
  await configureDependencies();
  runApp(App());
}
