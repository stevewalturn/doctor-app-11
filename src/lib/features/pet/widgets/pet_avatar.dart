import 'package:flutter/material.dart';

class PetAvatar extends StatelessWidget {
  const PetAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          Icons.pets,
          size: 100,
          color: Colors.grey[800],
        ),
      ),
    );
  }
}
