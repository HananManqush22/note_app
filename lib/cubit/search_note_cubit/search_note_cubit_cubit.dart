import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:not_hive_app/const/colors.dart';
import 'package:not_hive_app/models/note_model.dart';

part 'search_note_cubit_state.dart';

class SearchNoteCubitCubit extends Cubit<SearchNoteCubitState> {
  SearchNoteCubitCubit() : super(SearchNoteCubitInitial());
  static SearchNoteCubitCubit get(context) => BlocProvider.of(context);
  List<NoteModel> searchItem = [];
  searchNote(String qury) {
    try {
      emit(SearchNoteLodingState());
      var box = Hive.box<NoteModel>(boxName);
      if (qury.isNotEmpty) {
        emit(SearchNoteLodingState());
        searchItem = box.values
            .where((c) => c.title.toLowerCase().contains(qury))
            .toList();

        emit(SearchNoteSuccesState());
      }
    } catch (e) {
      emit(SearchNoteFailareState(errorMassage: e.toString()));
    }
  }
}
