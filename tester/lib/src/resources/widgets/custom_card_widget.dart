import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final String imagePath;
  final String label;
  final String location;
  final String description;
  final VoidCallback onCardTap;
  final VoidCallback onDonateTap;
  final VoidCallback? onViewTap;

  const CustomCardWidget({
    super.key,
    required this.imagePath,
    required this.label,
    required this.location,
    required this.description,
    required this.onCardTap,
    required this.onDonateTap,
    this.onViewTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 0, bottom: 0, right: 5),
          margin: const EdgeInsets.only(bottom: 3, left: 10, right: 5),
          height: 240,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: onCardTap,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(
                            0xFFFCFCFC), // MyColors.surfaceContainerLowest
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 10),
                      margin: const EdgeInsets.only(bottom: 135, left: 280),
                      width: 200,
                      height: 42,
                      child: Center(
                        child: Text(
                          label,
                          style: const TextStyle(
                            color: Color(0xFFFF0000), // Red color for the label
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(
                            0xFFFCFCFC), // MyColors.surfaceContainerLowest
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 10),
                      margin: const EdgeInsets.only(left: 250),
                      width: 200,
                      height: 38,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Center the content horizontally
                        crossAxisAlignment: CrossAxisAlignment
                            .center, // Center the content vertically
                        children: [
                          SizedBox(
                            width: 14,
                            height: 20,
                            child: Image.asset(
                              "assets/location.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                              width:
                                  5), // Optional: add spacing between image and text
                          Text(
                            location,
                            style: const TextStyle(
                              color:
                                  Color(0xFFFF0303), // Red color for location
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        IntrinsicHeight(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              color: Color(0xFFE9E9E9), // Gray color for bottom container
            ),
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 14),
            margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IntrinsicHeight(
                  child: SizedBox(
                    width: 260,
                    child: Text(
                      description,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 6, 6, 6), // MyColors.shadow
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                IntrinsicHeight(
                  child: GestureDetector(
                    onTap: onDonateTap,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFF0866FF),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: 80,
                      child: const Column(
                        children: [
                          Text(
                            "Xem",
                            style: TextStyle(
                              color: Color(
                                  0xFFF0F0F0), // MyColors.surfaceContainerLowest
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
