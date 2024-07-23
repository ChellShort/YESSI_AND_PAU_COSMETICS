import 'package:flutter/material.dart';
import 'package:yessi_pau/Views/pedido_cuenta.dart';

class DrawerHeaderCustom extends StatelessWidget {
  final String username;
  const DrawerHeaderCustom({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 188, 140, 190),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              child: const CircleAvatar(
                radius: 40,
                child: Icon(
                  Icons.person,
                  size: 40,
                ),
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => pedidoCuenta(),
                  ),
                )
              },
            ),
            const SizedBox(width: 20),
            Text(
              username,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ));
  }
}
