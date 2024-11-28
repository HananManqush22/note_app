import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:not_hive_app/views/widget/custom_search_appbar.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, required this.icon, this.onPresse});
  final String title;
  final IconData icon;
  final void Function()? onPresse;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 24),
        ),
        const Spacer(),
        CustomeSearchIcon(
          onPresse: onPresse,
          icon: icon,
        ),
      ],
    );
  }
}
