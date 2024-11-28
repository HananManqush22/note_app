import 'package:flutter/material.dart';

class CustomeSearchIcon extends StatelessWidget {
  const CustomeSearchIcon({super.key, required this.icon, this.onPresse});
  final IconData icon;
  final void Function()? onPresse;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(
        onPressed: onPresse,
        icon: Icon(
          icon,
          size: 28,
        ),
      ),
    );
  }
}
