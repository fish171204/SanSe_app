import 'package:flutter/material.dart';

class UserAvatarWidget extends StatelessWidget {
  final String imagePath;
  final String name;

  const UserAvatarWidget({
    super.key,
    required this.imagePath,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(imagePath),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 70,
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
