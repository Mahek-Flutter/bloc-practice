import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../di.dart';
import 'counter_bloc.dart';
import 'counter_event.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = getIt<CounterBloc>();
// JFU : Here value will use the same instance of the BLoC ,It will reused instead of creating a new one.

    return BlocProvider.value(
      value: counterBloc,
      child: Scaffold(
        appBar: AppBar(title: const Text('Counter')),
        body: Center(
          child: BlocBuilder<CounterBloc, int>(
            builder: (context, count) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Counter: $count'),
                  ElevatedButton(
                    onPressed: () => counterBloc.add(IncrementCounter()),
                    child: const Text('Increment'),
                  ),
                  ElevatedButton(
                    onPressed: () => counterBloc.add(DecrementCounter()),
                    child: const Text('Decrement'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
