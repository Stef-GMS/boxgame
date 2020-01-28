import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';

class BoxGame extends Game {
  Size screenSize;
  bool hasWon = false;

  void render(Canvas canvas) {
    // Draw black rectangle
    // rectangle from Top Left and width is the screen width and height is the screen height
    Rect bgRect = Rect.fromLTWH(0.0, 0.0, screenSize.width, screenSize.height);

    // paint using color specified in opacity (Alpha) where 0xff = fully opaque followed by the RGB values
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff000000);

    // draw rectangle on screen using size and color from above
    canvas.drawRect(bgRect, bgPaint);

    // Draw white square in middle of screen
    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    Rect boxRect = Rect.fromLTWH(screenCenterX - 75, screenCenterY - 75, 150, 150);
    Paint boxPaint = Paint();
    //boxPaint.color = Color(0xffffffff);

    if (hasWon) {
      boxPaint.color = Color(0xff00ff00);
    } else {
      boxPaint.color = Color(0xffffffff);
    }

    canvas.drawRect(boxRect, boxPaint);
  }

  void update(double t) {
    // TODO: implement update
  }

  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }

  void onTapDown(TapDownDetails d) {
    // handle taps here
    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    if (d.globalPosition.dx >= screenCenterX - 75 &&
        d.globalPosition.dx <= screenCenterX + 75 &&
        d.globalPosition.dy >= screenCenterY - 75 &&
        d.globalPosition.dy <= screenCenterY + 75) {
      hasWon = true;
    }
  }
}
