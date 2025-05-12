import 'package:flutter/material.dart';

class MyLogin extends StatelessWidget {
  final String text;
  final String IconPath;
  const MyLogin({super.key, required this.text, required this.IconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 180,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 1)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(IconPath,width: 35,height: 35,),

          SizedBox(width: 15,),

          Text(
            text,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
            ),
          )
        ],
      ),
    );
  }
}
