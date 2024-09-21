import 'package:hive/hive.dart';

part 'taskly_response_model.g.dart';

@HiveType(typeId: 0)
class TasklyResponseModel {
  @HiveField(0)
  String content;

  @HiveField(1)
  String dateTime;

  @HiveField(2)
  bool status;

  TasklyResponseModel({
    required this.content,
    required this.dateTime,
    required this.status,
  });
}
