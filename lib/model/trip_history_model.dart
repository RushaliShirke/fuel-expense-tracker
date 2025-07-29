import 'package:cloud_firestore/cloud_firestore.dart';

class TripHistory {
  final String vehicleType;
  final DateTime date;
  final double distance;
  final double fuelCost;
  final double fuelEconomy;
  final double mileage;

  TripHistory({
    required this.vehicleType,
    required this.date,
    required this.distance,
    required this.fuelCost,
    required this.fuelEconomy,
    required this.mileage,
  });

  factory TripHistory.fromMap(Map<String, dynamic> map) {
    return TripHistory(
      vehicleType: map['vehicleType'] ?? '',
      date: (map['date'] as Timestamp).toDate(),
      distance: (map['distance'] ?? 0).toDouble(),
      fuelCost: (map['fuelCost'] ?? 0).toDouble(),
      fuelEconomy: (map['fuelEconomy'] ?? 0).toDouble(),
      mileage: (map['mileage'] ?? 0).toDouble(),
    );
  }
}
