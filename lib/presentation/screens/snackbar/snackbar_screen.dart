import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});


  void showCustomSnackbar( BuildContext context ) {

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Contenido del Snackbar'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {},),
      duration: const Duration(seconds: 2),

    );

    ScaffoldMessenger.of(context).showSnackBar( snackbar );
    
  }

  void openDialog( BuildContext context ) {

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estas seguro?'),
        content: const Text('Tempor eu amet aute amet Lorem aliquip velit et tempor. Labore ad non occaecat excepteur minim. Ex duis officia velit sint dolor nostrud. Commodo occaecat id ullamco incididunt duis dolor laborum occaecat. Eu proident labore adipisicing dolor sit culpa sint fugiat culpa. Nulla reprehenderit irure id dolor dolore occaecat magna qui dolore non ut et Lorem.'),
        actions: [
          TextButton( onPressed: ()=> context.pop(), child: const Text('Cancelar')),  // ()=> navigator.of(context).pop  sin go_router

          FilledButton(onPressed: ()=> context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Reprehenderit irure eu reprehenderit irure eu duis id voluptate irure culpa. Esse excepteur elit occaecat mollit duis pariatur Lorem eu aliqua. Adipisicing ullamco ullamco adipisicing anim irure duis ex mollit veniam consequat. Sunt labore aute cillum non ex culpa ut voluptate velit tempor consectetur anim id commodo. Id aliqua amet id labore est consectetur aute.')
                  ]
                );
              }, 
              child: const Text('Licencias Usadas')),

            FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: const Text('Mostrar Diálogo'))
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon( Icons.remove_red_eye_outlined ),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}