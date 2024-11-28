import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_hive_app/cubit/search_note_cubit/search_note_cubit_cubit.dart';
import 'package:not_hive_app/views/widget/custom_text_filed.dart';
import 'package:not_hive_app/views/widget/custome_appbar.dart';
import 'package:not_hive_app/views/widget/note_list_view.dart';

class SearchNoteView extends StatelessWidget {
  const SearchNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SearchNoteCubitCubit(),
        child: BlocConsumer<SearchNoteCubitCubit, SearchNoteCubitState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  CustomAppBar(
                    title: 'Search Note',
                    icon: Icons.arrow_back,
                    onPresse: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFiled(
                    hint: 'Search',
                    onChanged: (value) {
                      SearchNoteCubitCubit.get(context).searchNote(value);
                    },
                  ),
                  state is SearchNoteLodingState
                      ? const Center(child: Text(''))
                      : Expanded(
                          child: NoteListView(
                          notes: SearchNoteCubitCubit.get(context).searchItem,
                        )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
