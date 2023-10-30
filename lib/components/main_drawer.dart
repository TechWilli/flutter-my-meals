import 'package:flutter/material.dart';
import 'package:flutter_my_meals/routes/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _createMenuItem(
      {required IconData icon, required String label, void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              icon,
              color: Colors.black,
            ),
            title: Text(label),
            horizontalTitleGap: 0,
          ),
          // const Divider(
          //   height: 0,
          //   thickness: 1,
          //   color: Colors.grey,
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // shape: ,
      surfaceTintColor: Colors.red,
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.all(14),
            // margin: const EdgeInsets.only(bottom: 8),
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Vamos cozinhar?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _createMenuItem(
            icon: Icons.restaurant,
            label: 'Categorias',
            onTap: () =>
                /* Neste caso em opções de drawer é mais correto fazer o push para a tela e o replace dela,
                para não ficar emplilhando infinitamente toda vez que navegar pelo drawer */
                Navigator.of(context).pushReplacementNamed(AppRoutes.HOME),
          ),
          _createMenuItem(
            icon: Icons.settings,
            label: 'Configurações',
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS),
          ),
        ],
      ),
    );
  }
}
