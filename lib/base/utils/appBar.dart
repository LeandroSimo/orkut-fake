import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:lottie/lottie.dart';

class AppBarBase{

  appBar(BuildContext context){
    return PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: SafeArea(
        child: Container(
          color: Theme.of(context).primaryColor,
          width: MediaQuery.of(context).size.width,
          child: Container(
            color: Colors.white,
            child: Stack(
              children: [
                RotatedBox(
                  quarterTurns: 2,
                  child: WaveWidget(
                    config: CustomConfig(
                      colors: [Color(0xFFFD9AB2), Color(0xFFFC527C),Color(0xFFFFC1D2)],
                      durations: [10000,8000,6000 ],
                      heightPercentages: [-0.4, -0.3, -0.2]
                    ),
                    size: Size(double.infinity, double.infinity),
                    waveAmplitude: 0,
                    isLoop: true,
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 90,
                  child: Image.asset(
                    'lib/assets/images/logo.png',
                    height: 50,
                    width: 200,
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}