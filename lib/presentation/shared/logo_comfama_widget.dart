import 'package:flutter/material.dart';

class LogoComfamaWidget extends StatelessWidget {
  const LogoComfamaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
            'https://pinondeoreja.com/wp/wp-content/uploads/2020/09/Logo-Confama-blanco.png',
            width: 100,
            height: 50,
            alignment: Alignment.center),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
