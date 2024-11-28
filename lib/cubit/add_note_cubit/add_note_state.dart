part of 'add_note_cubit.dart';

@immutable
sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

class AddNoteLodingState extends AddNoteState {}

class AddNoteFailareState extends AddNoteState {
  final String errorMassage;

  AddNoteFailareState({required this.errorMassage});
}

class AddNoteSuccesState extends AddNoteState {}
