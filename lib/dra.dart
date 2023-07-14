import 'package:flutter/material.dart';

class dra extends StatelessWidget {
  const dra({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.star_outline_outlined),
            title: Text('Starred'),
            onTap: () => print('Starred tapped'),
          ),
          ListTile(
            leading: Icon(Icons.archive_outlined),
            title: Text('Archived'),
            onTap: () => print('Archived tapped'),
          ),
          ListTile(
            leading: Icon(Icons.do_disturb),
            title: Text('Spam and blocked'),
            onTap: () => print('Spam and blocked tapped'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.devices),
            title: Text('Device pairing'),
            onTap: () => print('Device pairing tapped'),
          ),
          ListTile(
            leading: Icon(Icons.brightness_4_sharp),
            title: Text('Choose theme'),
            onTap: () => print('Theme tapped'),
          ),
        ],
      ),
    );
  }
}
