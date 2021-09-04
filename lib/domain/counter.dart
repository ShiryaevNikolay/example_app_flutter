import 'package:hive/hive.dart';

part 'counter.g.dart';

@HiveType(typeId: 0)
class Counter extends HiveObject{

  @HiveField(0)
  int? count;

  Counter({ this.count });
}