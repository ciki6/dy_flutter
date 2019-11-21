/*
 * @Author: LuXiaoFu 
 * @Date: 2019-11-20 14:10:19 
 * @Last Modified by:   LuXiaoFu 
 * @Last Modified time: 2019-11-20 14:10:19 
 */

import 'package:bloc/bloc.dart';

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield currentState - 1;
        break;
      case CounterEvent.increment:
        yield currentState + 1;
        break;
    }
  }
}
