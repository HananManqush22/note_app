import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:not_hive_app/const/colors.dart';
import 'package:not_hive_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  static AddNoteCubit get(context) => BlocProvider.of(context);
  Color color = const Color(0xffD7FDEC);
  addNote(NoteModel note) async {
    try {
      note.color = color.value;
      emit(AddNoteLodingState());

      var noteBox = Hive.box<NoteModel>(boxName);

      await noteBox.add(note);
      emit(AddNoteSuccesState());
    } catch (e) {
      emit(AddNoteFailareState(errorMassage: e.toString()));
    }
  }
}
