import 'package:flutter/material.dart';
import 'package:lojinha/src/config/custom_colors.dart';

class QuantityWidget extends StatelessWidget {
  final int value;
  final String suffixText;
  final Function(int quantity) result;
  final bool isRemovable;

  const QuantityWidget({
    Key? key,
    required this.suffixText,
    required this.value,
    required this.result,
    this.isRemovable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 2,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _QuantityButton(
            icon:
                !isRemovable || value > 1 ? Icons.remove : Icons.delete_forever,
            onPressed: () {
              if (value == 1 && !isRemovable) return;

              int resultCount = value - 1;
              result(resultCount);
            },
            color: !isRemovable || value > 1 ? Colors.grey : Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '$value$suffixText',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _QuantityButton(
            icon: Icons.add,
            onPressed: () {
              int resultCount = value + 1;
              result(resultCount);
            },
            color: CustomColors.customSawtchColor,
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const _QuantityButton({
    Key? key,
    required this.color,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed,
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
