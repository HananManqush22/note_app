import 'package:flutter/material.dart';
import 'package:not_hive_app/cubit/add_note_cubit/add_note_cubit.dart';

class ColorListVew extends StatefulWidget {
  const ColorListVew({
    super.key,
  });

  @override
  State<ColorListVew> createState() => _ColorListVewState();
}

class _ColorListVewState extends State<ColorListVew> {
  int curentIndext = 0;
  List<Color> colors = const [
    Color(0xffD7FDEC),
    Color(0xffA9FBD7),
    Color(0xffB2E4DB),
    Color(0xffB0C6CE),
    Color(0xff938BA1),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2,
      child: ListView.builder(
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: InkWell(
                onTap: () {
                  curentIndext = index;
                  AddNoteCubit.get(context).color = colors[index];
                  setState(() {});
                },
                child: ColorItem(
                  isActiv: curentIndext == index,
                  color: colors[index],
                ),
              ),
            );
          }),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActiv, required this.color});

  final bool isActiv;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActiv
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 32,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 29,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 32,
          );
  }
}
