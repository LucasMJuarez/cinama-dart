import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});
  final messages = <String>[
    'Espere un momento',
    'Cargando...',
    'Un momento por favor',
    'Estamos trabajando para usted',
    'Cargando información',
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere un momento'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(color: Colors.indigo, strokeWidth: 2),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
