import 'package:flutter/material.dart';

class SettingRow extends StatelessWidget {
  final String title;
  final Widget trailing;

  const SettingRow({
    super.key,
    required this.title,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}