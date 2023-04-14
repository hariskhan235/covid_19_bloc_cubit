import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.amber,
          ),
          child: Column(
            children: const [
              ListTile(
                title: Text('Covid States'),
                subtitle: Text('To see covid 19 statistics'),
              ),
              ListTile(
                  title: Text('Covid Countries States'),
                  subtitle: Text('To see covid 19 Country vise statistics')),
              ListTile(
                title: Text('Covid Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
