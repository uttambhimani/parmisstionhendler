import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class locationProvider extends ChangeNotifier{

  double? longi,lati;
  List pl=[];

  void getPosition()async{

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    longi = position.longitude;
    lati = position.latitude;
    List placemark = await placemarkFromCoordinates(lati!, longi!);
    pl=placemark;
    notifyListeners();
  }
}