import 'dart:async';

import 'package:drosq8/Views/main_screens/qibla/loading_indicator.dart';
import 'package:drosq8/widgets/location_error.dart';
import 'package:drosq8/widgets/qibla_compass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';

class QiblahCompass extends StatefulWidget {
  const QiblahCompass({super.key});

  @override
  State<QiblahCompass> createState() => _QiblahCompassState();
}

class _QiblahCompassState extends State<QiblahCompass> {
  final _locationStreamController =
      StreamController<LocationStatus>.broadcast();

  get stream => _locationStreamController.stream;

  @override
  void initState() {
    _checkLocationStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        }

        if (snapshot.data!.enabled == true) {
          switch (snapshot.data!.status) {
            case LocationPermission.always:
            case LocationPermission.whileInUse:
              return QiblahCompassWidget();

            case LocationPermission.denied:
              return LocationErrorWidget(
                error: "Location service permission denied",
                callback: _checkLocationStatus,
              );
            case LocationPermission.deniedForever:
              return LocationErrorWidget(
                error: "Location service Denied Forever !",
                callback: _checkLocationStatus,
              );
            // case GeolocationStatus.unknown:
            //   return LocationErrorWidget(
            //     error: "Unknown Location service error",
            //     callback: _checkLocationStatus,
            //   );
            default:
              return const SizedBox();
          }
        } else {
          return LocationErrorWidget(
            error: "Please enable Location service",
            callback: _checkLocationStatus,
          );
        }
      },
    );
  }

  Future<void> _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
    } else {
      _locationStreamController.sink.add(locationStatus);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _locationStreamController.close();
    FlutterQiblah().dispose();
  }
}
