import 'package:flutter/material.dart';
import 'package:flutter_bloc_counter/counter/view/counter_page.dart';
import 'package:flutter_bloc_counter/counter/view/counter_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(CounterPage, () {
    testWidgets('renders $CounterView', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: CounterPage(),
      ));
      expect(find.byType(CounterView), findsOneWidget);
    });
  });
}
