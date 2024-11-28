part of 'search_note_cubit_cubit.dart';

@immutable
sealed class SearchNoteCubitState {}

final class SearchNoteCubitInitial extends SearchNoteCubitState {}

class SearchNoteLodingState extends SearchNoteCubitState {}

class SearchNoteFailareState extends SearchNoteCubitState {
  final String errorMassage;

  SearchNoteFailareState({required this.errorMassage});
}

class SearchNoteSuccesState extends SearchNoteCubitState {}
