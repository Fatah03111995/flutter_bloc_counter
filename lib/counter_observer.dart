import 'package:bloc/bloc.dart';

class CounterObserver extends BlocObserver {
  const CounterObserver();
  @override
  void onChange(BlocBase bloc, Change change) {
    // this function work both onbloc and cubit
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}
