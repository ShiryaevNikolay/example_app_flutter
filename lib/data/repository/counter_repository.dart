import 'package:example_app_flutter/data/storage/counter_storage.dart';
import 'package:example_app_flutter/domain/counter.dart';
import 'package:hive/hive.dart';

class CounterRepository {
  static final CounterRepository _counterRepository =
      CounterRepository._internal();
  CounterRepository._internal();

  factory CounterRepository() => _counterRepository;

  CounterStorage _counterStorage = CounterStorage();

  Box<Counter> getCounterBox() => _counterStorage.box;

  void addCounter(Counter counter) {
    _counterStorage.addCounter(counter);
  }

  void updateCounter(Counter counter) {
    _counterStorage.updateCounter(counter);
  }

  void deleteCounter(Counter counter) {
    _counterStorage.deleteCounter(counter);
  }

  void closeBox() {
    _counterStorage.closeBox();
  }
}
