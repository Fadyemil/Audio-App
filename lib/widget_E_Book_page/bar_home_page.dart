import 'package:flutter/material.dart';

class BarHomePage extends StatelessWidget {
  const BarHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.view_list),
        ),
        const Spacer(),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            const SizedBox(width: 18),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_active_rounded),
            ),
          ],
        )
      ],
    );
  }
}
