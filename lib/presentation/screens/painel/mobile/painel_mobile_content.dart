import 'package:flutter/material.dart';
import 'package:torpheus/core/constants/custom_colors.dart';

class PainelMobileContent extends StatelessWidget {
  const PainelMobileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ColorConstants.corFundo,
        title: Text(
          'Painel Geral',
          style: TextStyle(
            color: ColorConstants.corTexto,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              elevation: 0.0,
              onPressed: () {},
              backgroundColor: ColorConstants.chambray,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
