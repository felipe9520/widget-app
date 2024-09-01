import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
//import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('Fluter + Material 3'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {

    //final menuItems = appMenuItems[];

    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        // final  menuItem = appMenuItems[0].title;     //* <= esta fue mi solución jjjj
        final menuItem = appMenuItems[index];

        //return Text(menuItem.title);
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon( menuItem.icon, color: colors.primary ),
      trailing: Icon( Icons.arrow_forward_ios_rounded, color: colors.primary ),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subtitle),
      onTap: () {
        
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen(),
        //   ),
        // );  // SE PUEDE USAR Y ES PERMITIDO

        // HACIENDO USO DE LOS NAME (menuItem.link)
        Navigator.pushNamed( context, menuItem.link );

      },
    );
  }
}

