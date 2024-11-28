import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:not_hive_app/const/colors.dart';
import 'package:not_hive_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  static NotesCubit get(context) => BlocProvider.of(context);
  List<NoteModel>? nots;
  fechAllData() {
    var noteBox = Hive.box<NoteModel>(boxName);
    nots = noteBox.values.toList();
    emit(NotesSuccesState());
  }
}
