import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:not_hive_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:not_hive_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:not_hive_app/models/note_model.dart';
import 'package:not_hive_app/views/widget/custom_button.dart';
import 'package:not_hive_app/views/widget/custom_listvew_color.dart';
import 'package:not_hive_app/views/widget/custom_text_filed.dart';

class AddNotForm extends StatefulWidget {
  const AddNotForm({
    super.key,
  });

  @override
  State<AddNotForm> createState() => _AddNotFormState();
}

class _AddNotFormState extends State<AddNotForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, supTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextFiled(
            hint: 'Title',
            onSave: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFiled(
            hint: 'cotent',
            maxLine: 5,
            onSave: (value) {
              supTitle = value;
            },
          ),
          const SizedBox(
            height: 32,
          ),
          const ColorListVew(),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                  isLoding: state is AddNoteLodingState ? true : false,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var curentTime = DateTime.now();
                      var formatCurentTime =
                          DateFormat("dd-MM-yyyy").format(curentTime);

                      var noteModel = NoteModel(
                          title: title!,
                          subTitle: supTitle!,
                          date: formatCurentTime.toString(),
                          color: Colors.blue.value);
                      AddNoteCubit.get(context).addNote(noteModel);
                      NotesCubit.get(context).fechAllData();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                    }
                  });
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
