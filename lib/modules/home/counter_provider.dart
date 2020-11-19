import 'package:hooks_riverpod/all.dart';

class Counter {
  final int count;

  Counter({this.count});
}

class CounterNotifier extends StateNotifier<Counter> {
  CounterNotifier(Counter state) : super(state = Counter(count: 0));

  void increment() {
    state = Counter(count: state.count + 1);
  }
}

final counterProvider = StateNotifierProvider<CounterNotifier>((ref) {
  return CounterNotifier(Counter(count: 0));
});
