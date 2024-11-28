import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:not_hive_app/const/colors.dart';
import 'package:not_hive_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:not_hive_app/models/note_model.dart';
import 'package:not_hive_app/simple_observer_bloc.dart';
import 'package:not_hive_app/views/note_view.dart';

void main() async {
  Bloc.observer = SimpleObserverBloc();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(boxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        home: const NoteView(),
      ),
    );
  }
}
