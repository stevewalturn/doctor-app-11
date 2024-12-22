import 'package:flutter/material.dart';
import 'package:my_app/ui/common/app_colors.dart';

class PetActionButtons extends StatelessWidget {
  final VoidCallback onFeed;
  final VoidCallback onPlay;
  final VoidCallback onSleep;
  final bool isBusy;

  const PetActionButtons({
    Key? key,
    required this.onFeed,
    required this.onPlay,
    required this.onSleep,
    required this.isBusy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _ActionButton(
          icon: Icons.restaurant,
          label: 'Feed',
          onPressed: isBusy ? null : onFeed,
        ),
        _ActionButton(
          icon: Icons.sports_esports,
          label: 'Play',
          onPressed: isBusy ? null : onPlay,
        ),
        _ActionButton(
          icon: Icons.bedtime,
          label: 'Sleep',
          onPressed: isBusy ? null : onSleep,
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  const _ActionButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: kcPrimaryColor,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
          ),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
