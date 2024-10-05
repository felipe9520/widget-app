import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';
// import 'package:widgets_app/presentation/screens/cards/cards_screen.dart'; //go_router pushName


class HomeScreen extends StatelessWidget {

  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>(); 

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
      title: const Text('Fluter + Material 3'),
      ),
      body: const _HomeView(),
      drawer: SideMenu(scaffolfKey: scaffoldKey,),
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

        // * propias de Flutter *
        // SE PUEDE USAR Y ES PERMITIDO
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen(),
        //   ),
        // );
        // HACIENDO USO DE LOS NAME (menuItem.link)
        // Navigator.pushNamed( context, menuItem.link );
        
        // * con go_router * 
        context.push( menuItem.link );   // .push para ir a y volver de, .go para ir a
        // go_routerName
        //context.pushNamed( CardsScreen.name );

      },
    );
  }
}

