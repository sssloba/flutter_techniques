import 'package:flutter/material.dart';
import 'package:flutter_techniques/utils/extensions.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile(
    this.route, {
    this.onTap,
    super.key,
  });

  final Function? onTap;
  final Widget route;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            title: Text(
              route.splitOnCapitals(),
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.indigoAccent,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              onTap;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => route,
                ),
              );
            }),
        const Divider(),
      ],
    );
  }
}
