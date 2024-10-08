import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_counter/counter/cubit/counter_cubit.dart';
import 'package:flutter_bloc_counter/counter/view/counter_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockCounterCubit extends MockCubit<int> implements CounterCubit {}

const _incrementButtonKey = Key('counterView_increment_fab');
const _decrementButtonKey = Key('counterView_decrement_fab');
void main() {
  late CounterCubit counterCubit;

  setUp(() {
    counterCubit = _MockCounterCubit();
  });

  group(CounterView, () {
    testWidgets('renders current $CounterCubit state', (tester) async {
      when(() => counterCubit.state).thenReturn(42);
      await tester.pumpWidget(MaterialApp(
        home: BlocProvider.value(
          value: counterCubit,
          child: const CounterView(),
        ),
      ));

      expect(find.text('42'), findsOneWidget);
    });

    testWidgets('tapping increment button invokes increment', (tester) async {
      when(() => counterCubit.state).thenReturn(0);
      when(() => counterCubit.increment()).thenReturn(null);
      //when increment is called, it is not return any value.
      await tester.pumpWidget(MaterialApp(
        home: BlocProvider.value(
          value: counterCubit,
          child: const CounterView(),
        ),
      ));

      await tester.tap(find.byKey(_incrementButtonKey));
      verify(() => counterCubit.increment()).called(1);
    });

    testWidgets('tapping decrement button invokes decrement', (tester) async {
      when(() => counterCubit.state).thenReturn(0);
      when(() => counterCubit.decrement()).thenReturn(null);
      await tester.pumpWidget(MaterialApp(
        home: BlocProvider.value(
          value: counterCubit,
          child: const CounterView(),
        ),
      ));
      final decrementFinder = find.byKey(_decrementButtonKey);
      await tester.ensureVisible(decrementFinder);
      await tester.tap(decrementFinder);
      verify(() => counterCubit.decrement()).called(1);
    });
  });
}
