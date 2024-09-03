import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ButtonsScreen extends StatelessWidget {

  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),        
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_outlined),
        onPressed: () {
          context.pop(); // con go_router
          // Navigator.of(context).pop();  // sin go_router
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            // ElevatedButtons
            ElevatedButton(onPressed: () {}, child: const Text('Elevated Button')),

            const ElevatedButton(onPressed: null, child: Text('Elevated Disabled')),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded), 
              label: const Text('Elevated')),

            // FilledButtons
            FilledButton(onPressed: () {}, child: const Text('Filled Button')),
            
            FilledButton.icon(
              onPressed: () {}, 
              icon: const Icon(Icons.baby_changing_station_outlined),
              label: const Text('Filled'),
            ),

            // OutlinedButton
            OutlinedButton(onPressed: () {}, child: const Text('Outlined Button')),
            
            OutlinedButton.icon(
              onPressed: () {}, 
              icon: const Icon(Icons.folder_copy_outlined),
              label: const Text('Outlined')
            ),

            // TextButton
            TextButton(onPressed: () {}, child: const Text('Text Button')),

            TextButton.icon(
              onPressed: () {}, 
              icon: const Icon(Icons.terminal_outlined), 
              label: const Text('Text')
            ),

            const CustonButton(),

            // IconButton
            IconButton(onPressed: () {}, icon: const Icon(Icons.app_registration_rounded)),
            // como aplicar mas style al IconButton (personalizarlo)
            IconButton(
              onPressed: () {}, 
              icon: const Icon( Icons.app_registration_rounded),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll( colors.primary ),
                iconColor: const MaterialStatePropertyAll( Colors.white ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}


class CustonButton extends StatelessWidget {
  const CustonButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric( horizontal: 20, vertical: 10),
            child: Text('Personalizado', style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}