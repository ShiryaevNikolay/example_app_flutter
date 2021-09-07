import 'package:example_app_flutter/domain/counter.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CounterStorage {
  static const String COUNTERS_BOX_NAME = "counters";

  final Box<Counter> _counterBox = Hive.box<Counter>(COUNTERS_BOX_NAME);
  Box<Counter> get box => _counterBox;

  static final CounterStorage _counterStorage = CounterStorage._internal();
  CounterStorage._internal();

  factory CounterStorage() => _counterStorage;

  void addCounter(Counter counter) {
    box.add(counter);
  }

  void updateCounter(Counter counter) {
    counter.save();
  }

  void deleteCounter(Counter counter) {
    counter.delete();
  }

  void closeBox() {
    box.close();
  }
}