import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void openDialog(BuildContext context) {
  var size = MediaQuery.of(context).size;
  showGeneralDialog(
    barrierColor: Colors.black.withOpacity(0.5),
    transitionBuilder: (context, a1, a2, widget) {
      return Transform.scale(
        scale: a1.value,
        child: Opacity(
          opacity: a1.value,
          child: AlertDialog(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            title: Column(
              children: [
                SizedBox(
                  height: size.width > 600 ? 120 : size.width * .2,
                  child: Image.asset('assets/dialog_images/no-internet.png'),
                ),
                Text('No internet connection',
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            content: Text('Please check your internet connection',
                style: Theme.of(context).textTheme.bodyMedium),
          ),
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 200),
    barrierDismissible: true,
    barrierLabel: '',
    context: context,
    pageBuilder: (context, animation1, animation2) {
      return Container();
    },
  );
}

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            openDialog(context);
          },
          child: const Text('Open Dialog'),
        ),
      ),
    );
  }
}
