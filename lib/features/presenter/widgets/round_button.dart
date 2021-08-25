import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;

  const RoundButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Informe a data'),
      onPressed: onPressed,
    );

    // GestureDetector(
    //   child: Container(
    //     width: 220,
    //     padding: const EdgeInsets.symmetric(
    //       vertical: 10,
    //       horizontal: 30,
    //     ),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(18),
    //       color: Theme.of(context).buttonColor,
    //     ),
    //     child: Text(
    //       label,
    //       textAlign: TextAlign.center,
    //       style: Theme.of(context).textTheme.button,
    //     ),
    //   ),
    //   onTap: () => onTap,
    // );
  }
}
