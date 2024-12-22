import 'package:flutter/material.dart';
import 'package:my_app/models/pet.dart';

class PetStatusBar extends StatelessWidget {
  final Pet pet;

  const PetStatusBar({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          pet.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _StatusIndicator(
          label: 'Happiness',
          value: pet.happiness,
          color: Colors.yellow,
        ),
        const SizedBox(height: 8),
        _StatusIndicator(
          label: 'Hunger',
          value: pet.hunger,
          color: Colors.red,
        ),
        const SizedBox(height: 8),
        _StatusIndicator(
          label: 'Energy',
          value: pet.energy,
          color: Colors.blue,
        ),
      ],
    );
  }
}

class _StatusIndicator extends StatelessWidget {
  final String label;
  final int value;
  final Color color;

  const _StatusIndicator({
    Key? key,
    required this.label,
    required this.value,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: $value%',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: value / 100,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ],
    );
  }
}
