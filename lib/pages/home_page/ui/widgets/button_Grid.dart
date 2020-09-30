import 'package:flutter/material.dart';

class BotonGrid {
  Widget botton(context, pageRute, boxColor, shadowColor, tittle) {
    return GestureDetector(
      child: Container(
        height: 65,
        width: 190,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: -40,
              left: -30,
              child: Image.asset("assets/images/pokeball.png",
                height: 60,
                width: 60,
                color: Colors.white.withOpacity(0.2)
              )
            ),
            Positioned(
              top: 5.0,
              right: -05.0,
              child: Image.asset("assets/images/pokeball.png",
                height: 50,
                width: 50,
                color: Colors.white.withOpacity(0.2)
              )
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 10.0),
              child: Text(tittle, 
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: "CircularStd-Bold",
                  color: Colors.white,
                  fontSize: 15
                ),
              )
            )
          ],
        ),
      ),
      onTap: () => Navigator.pushNamed(context, pageRute),
    );
  }
}