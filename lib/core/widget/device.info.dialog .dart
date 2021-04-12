import 'dart:io';

import 'package:agent/config/flavor.config.dart';
import 'package:agent/core/utils/string.utils.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

import '../utils/device.utils.dart';

class DeviceInfoDialog extends StatelessWidget {
  DeviceInfoDialog();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(bottom: 10.0),
      title: Container(
        padding: EdgeInsets.all(15.0),
        color: FlavorConfig.instance.color,
        child: Text(
          'Device Info',
          style: TextStyle(color: Colors.white),
        ),
      ),
      titlePadding: EdgeInsets.all(0),
      content: _getContent(),
    );
  }

  Widget _getContent() {
    if (Platform.isAndroid) {
      return _androidContent();
    }
    if (Platform.isIOS) {
      // return _iOSContent();
    }
    return Text("You're not on Android neither iOS");
  }

  //Widget _iOSContent() {} omitted for simplicity
  Widget _androidContent() {
    return FutureBuilder(
        future: DeviceUtils.androidDeviceInfo(),
        builder: (context, AsyncSnapshot<AndroidDeviceInfo> snapshot) {
          if (!snapshot.hasData) return Container();
          AndroidDeviceInfo device = snapshot.data;
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildTile('Flavor:', '${FlavorConfig.instance.name}'),
                _buildTile('Build mode:',
                    '${StringUtils.enumName(DeviceUtils.currentBuildMode().toString())}'),
                _buildTile('Physical device?:', '${device.isPhysicalDevice}'),
                _buildTile('Manufacturer:', '${device.manufacturer}'),
                _buildTile('Model:', '${device.model}'),
                _buildTile('Android version:', '${device.version.release}'),
                _buildTile('Android SDK:', '${device.version.sdkInt}')
              ],
            ),
          );
        });
  }

  Widget _buildTile(String key, String value) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Row(
        children: <Widget>[
          Text(
            key,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value)
        ],
      ),
    );
  }
}
