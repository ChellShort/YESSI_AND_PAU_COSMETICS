import 'package:flutter/material.dart';
import 'package:yessi_pau/widgets/appbar.dart';

class InspectPublicity extends StatelessWidget {
  final String image;
  const InspectPublicity({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppbarCustom(),
      ),
      body: Center(
        child: InteractiveViewer(child: Image.asset(image)),
      ),
    );
  }
}