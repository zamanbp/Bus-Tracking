import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleMapsButton extends StatelessWidget {
  double? latitude;
  double? longitude;

  GoogleMapsButton({this.latitude, this.longitude});

  void _launchMaps() async {
    final url = 'https://www.google.com/maps/search/?api=1&query=11.254703751054588,75.78401364473832';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _launchMaps,
      child: Text('Open Google Maps'),
    );
  }
}
