import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_hive_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:not_hive_app/views/widget/add_not_form.dart';

class AddNoteBottonSheet extends StatelessWidget {
  const AddNoteBottonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteFailareState) {}
            if (state is AddNoteSuccesState) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return const AbsorbPointer(
                absorbing: State is AddNoteLodingState ? true : false,
                child: SingleChildScrollView(child: AddNotForm()));
          },
        ),
      ),
    );
  }
}
