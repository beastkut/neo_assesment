import 'package:flutter/material.dart';


class OverviewTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  final Color textColor;
  final Color borderColor;
  final Color tileColor;

  const OverviewTile({
    super.key,
    required this.text,
    required this.icon,
    required this.iconColor,
    required this.textColor,
    required this.borderColor,
    required this.tileColor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Container(
        padding: EdgeInsets.all(12),
        height: 200,
        width: 150,
        decoration: BoxDecoration(
          color: tileColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor,width: 2)
        ),

        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 23,
                  color: textColor
              ),
            ),

            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  icon,
                  color: iconColor,
                  size: 45,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
