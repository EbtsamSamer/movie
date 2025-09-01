import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width*0.3,
          height: MediaQuery.sizeOf(context).height*0.21,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage("assets/images/poster6.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
