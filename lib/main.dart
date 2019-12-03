/*
 * @Author: LuXiaoFu 
 * @Date: 2019-11-20 10:36:22 
 * @Last Modified by: LuXiaoFu
 * @Last Modified time: 2019-11-20 10:56:00
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';
import 'dy_index/index.dart';
import 'dy_room/index.dart';

class DyApp extends StatelessWidget {
  //动态路由传递参数
  Route<dynamic> _getRoute(RouteSettings settings) {
    Map<String, WidgetBuilder> routes = {
      '/': (BuildContext context) => DyIndexPage(),
      '/room': (BuildContext context) =>
          DyRoomPage(arguments: settings.arguments),
    };
    var route = routes[settings.name];

    if (route != null) {
      return MaterialPageRoute<void>(
        settings: settings,
        builder: route,
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      builder: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'DYFlutter',
        theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
          primarySwatch: Colors.orange,
        ),
        onGenerateRoute: _getRoute,
      ),
    );
  }
}

void main() => runApp(new DyApp());
