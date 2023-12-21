import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sensors_plus/sensors_plus.dart';

class TiltSensorApp extends StatelessWidget {
  const TiltSensorApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 가로모드 고정
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);

    // 화면 최대 width , height를 통해 중간값 얻기
    final centerX = MediaQuery.of(context).size.width / 2 - 50;
    final centerY = MediaQuery.of(context).size.height / 2 - 50;

    return Scaffold(
      body: Stack(
        children: [
          StreamBuilder<AccelerometerEvent>(
              stream: accelerometerEventStream(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: Center(
                      // 로딩창 표시
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                final event = snapshot.data!;
                List<double> accelrometerValues = [event.x, event.y, event.z];

                return Positioned(
                  left: centerX + event.y * 20,
                  top: centerY + event.x * 20,
                  child: Container(
                    // 박스 모양 커스텀
                    decoration: const BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                    width: 100,
                    height: 100,
                  ),
                );
              }),
        ],
      ),
    );
  }
}
