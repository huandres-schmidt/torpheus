import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torpheus/core/constants/custom_colors.dart';
import 'package:torpheus/presentation/screens/menu/bloc/menu_bloc.dart';

import '../../painel/painel_screen.dart';
import '../menu_screen.dart';

class MenuWebBody extends StatelessWidget {
  const MenuWebBody({
    super.key,
    required this.indexScreen,
    required this.menuParametros,
  });

  final int indexScreen;
  final MenuParametros menuParametros;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          backgroundColor: ColorConstants.chambray,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          selectedLabelTextStyle: const TextStyle(color: Colors.white),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          unselectedLabelTextStyle: const TextStyle(color: Colors.grey),
          extended: true,
          onDestinationSelected: (index) {
            context.read<MenuBloc>().add(MenuTrocarTela(index));
          },
          destinations: items,
          selectedIndex: indexScreen,
          trailing: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'HS',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Huandres Schmidt',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(child: Center(child: _widgetPages().elementAt(indexScreen))),
      ],
    );
  }

  List<Widget> _widgetPages() {
    return [
      PainelScreen(painelBloc: menuParametros.homeBloc),
      const Text('Ordens de serviço'),
      const Text('Mecânicos'),
      const Text('Clientes'),
      const Text('Relatório'),
    ];
  }

  List<NavigationRailDestination> get items => [
        const NavigationRailDestination(
          icon: Icon(Icons.dashboard),
          label: Text('Painel'),
        ),
        const NavigationRailDestination(
          icon: Icon(Icons.folder),
          label: Text('Ordens de serviço'),
        ),
        const NavigationRailDestination(
          icon: Icon(Icons.group),
          label: Text('Mecânicos'),
        ),
        const NavigationRailDestination(
          icon: Icon(Icons.person),
          label: Text('Clientes'),
        ),
        const NavigationRailDestination(
          icon: Icon(Icons.add_chart_sharp),
          label: Text('Relatório'),
        ),
      ];
}
