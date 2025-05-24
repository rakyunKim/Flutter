import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final String padNumber;
  final void Function() onTap;
  final Color? color;
  const CircleButton({
    super.key, 
    required this.padNumber, 
    required this.onTap,
    this.color = Colors.blueGrey,
  });
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:Ink(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              customBorder: CircleBorder(),
              onTap: onTap,
                child: Container(
                padding: EdgeInsets.all(25),
                alignment: Alignment.center,
                child: Text(
                  padNumber,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                    ),
                ),
              ),
            ),
          ),
      );
  }

}