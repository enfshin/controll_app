import 'package:flutter/material.dart';

LinearGradient MyGradient(color1, color2) => LinearGradient(
    colors: [color1, color2],
    // colors: [Color(0xFF3fd89f), Color(0xFF3eb9b4)],
    begin: FractionalOffset(0.0, 0.0),
    end: FractionalOffset(1.0, 1.0),
    stops: [0.3, 1.0],
    tileMode: TileMode.clamp);
