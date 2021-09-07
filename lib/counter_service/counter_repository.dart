
import 'package:example_app_flutter/domain/counter.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class CounterRepository {
  static const String COUNTERS_BOX_NAME = "counters"; //const именуются в camelCase

  //Все это можно вынести в main, все равно без этой инициалиации приложение не запустится.
  Future<Box<Counter>> getBoxCounters() async {
    var dir =  await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(CounterAdapter());
    return Hive.openBox<Counter>(COUNTERS_BOX_NAME);
  }

  void addCounter(Counter counter) async {
    Box<Counter> box = Hive.box(COUNTERS_BOX_NAME);
    box.add(counter);
  }
}