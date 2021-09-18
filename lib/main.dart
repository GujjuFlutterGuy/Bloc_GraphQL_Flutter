import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/blocs/home/home.dart';
import 'package:flutter_bloc_demo/blocs/simple_delegate.dart';
import 'package:flutter_bloc_demo/screens/home_screen.dart';

void main() {
  BlocSupervisor.delegate = MySimpleBlocDelegate();

  runApp(MyApp());
}

//TODO: Here is the query
String query = r'''
  query GetImages{
     episode(id: 1) {
        characters {
          image
        }
      }
    }
''';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc()..add(FetchHomeData(query)),
        child: HomeScreen(),
      ),
    );
  }
}
