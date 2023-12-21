import 'package:flutter/material.dart';

class TiltSensorApp extends StatelessWidget {
  const TiltSensorApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 화면 최대 width , height를 통해 중간값 얻기
    final centerX = MediaQuery.of(context).size.width / 2 - 50;
    final centerY = MediaQuery.of(context).size.height / 2 - 50;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: centerX,
            top: centerY,
            child: Container(
              // 박스 모양 커스텀
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle
              ),
              width: 100,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}
