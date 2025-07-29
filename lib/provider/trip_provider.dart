import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TripProvider extends ChangeNotifier {
  String _vehicleType = 'Car';

  double _startOdometer = 0;
  double _endOdometer = 0;
  double _fuelFilled = 0;
  double _fuelPrice = 0;
  double _distance = 0;
  double _mileage = 0;
  double _totalFuelCost = 0;
  double _fuelEconomy = 0;
  bool _hasCalculated = false;

  /// Getters
  String get vehicleType => _vehicleType;
  double get distance => _distance;
  double get mileage => _mileage;
  double get totalFuelCost => _totalFuelCost;
  double get fuelEconomy => _fuelEconomy;
  bool get hasCalculated => _hasCalculated;

  /// Setters with notifyListeners
  void setVehicleType(String type) {
    _vehicleType = type;
    notifyListeners();
  }

  void setStartOdometer(String value) {
    _startOdometer = double.tryParse(value) ?? 0.0;
    notifyListeners();
  }

  void setEndOdometer(String value) {
    _endOdometer = double.tryParse(value) ?? 0.0;
    notifyListeners();
  }

  void setFuelFilled(String value) {
    _fuelFilled = double.tryParse(value) ?? 0.0;
    notifyListeners();
  }

  void setFuelPrice(String value) {
    _fuelPrice = double.tryParse(value) ?? 0.0;
    notifyListeners();
  }

  ///calculation
  void calculation(){
    if(_endOdometer > _startOdometer && _fuelFilled != 0 && _fuelPrice !=0 ){
      _distance = _endOdometer - _startOdometer;
      _mileage =  distance / _fuelFilled;
      _totalFuelCost = _fuelFilled * _fuelPrice;
      if(distance != 0){
        _fuelEconomy = totalFuelCost / distance;
      }else{
        SnackBar(content: Text('Please Enter Valid Details'),);
      }
      _hasCalculated = true;
      notifyListeners();
      print(_distance);
      print(mileage);
      print(totalFuelCost);
      print(fuelEconomy);
    }
  }

  ///AddHistoryToFirebase
  Future<void> addHistory()async{
    try{
      final data = await FirebaseFirestore.instance.collection("trip-history").add({
        "vehicleType": vehicleType,
        "date": FieldValue.serverTimestamp(),
        "distance": distance,
        "fuelCost": totalFuelCost,
        "fuelEconomy": fuelEconomy,
        "mileage": mileage
      });
    }catch(e){
      print(e);
    }
  }

}
