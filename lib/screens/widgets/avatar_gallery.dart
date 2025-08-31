import 'package:flutter/material.dart';

import '../register/sign_up/data/avater_model.dart';


class AvatarGallery extends StatelessWidget {
  final List<Avatar> avatars;
  final String? selectedId;
  final ValueChanged<String> onSelected;

  const AvatarGallery({
   super.key,
    required this.avatars,
    this.selectedId,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,

        itemCount: avatars.length + 1,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          if (index < avatars.length) {
            final a = avatars[index];
            final isSelected = a.id == selectedId;

            return GestureDetector(
              onTap: () => onSelected(a.id),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CircleAvatar(
                  radius:isSelected? 80:40,
                  backgroundImage: AssetImage(a.image),

                ),
              ),
            );
          } else {
            // "Create Avatar" tile
            return Container(
              width: 76,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(60),
              ),
              child: const Icon(Icons.add, color: Colors.yellow, size: 28),
            );
          }
        },
      ),
    );
  }
}