import 'package:flutter/material.dart';
import 'package:fuel_mileage_tracker/provider/trip_provider.dart';
import 'package:provider/provider.dart';

class VehicleInputCard extends StatelessWidget {
  final dynamic vehicleType;
  VehicleInputCard({super.key, required this.vehicleType});
  bool showResult = false;

  @override
  Widget build(BuildContext context) {
    final tripProvider = Provider.of<TripProvider>(context);

    return Container(
      color: Color(0xFFF7F9FC),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              vehicleType.toString().split('.').last.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF3366FF),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Start Odometer (km)',
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )
              ),
              onChanged: tripProvider.setStartOdometer,
            ),
            const SizedBox(height: 15),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'End Odometer (km)',
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )
              ),
              onChanged: tripProvider.setEndOdometer,
            ),
            const SizedBox(height: 15),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Fuel Filled (litres)',
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )
              ),
              onChanged: tripProvider.setFuelFilled,
            ),
            const SizedBox(height: 15),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Fuel Price (₹)',
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )
              ),
              onChanged: tripProvider.setFuelPrice,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                tripProvider.calculation();
                tripProvider.addHistory();
                // Define this
              },
                style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(Color(0xFF3366FF),),
                    fixedSize: WidgetStatePropertyAll(Size(
                        MediaQuery.of(context).size.width*0.4,
                        MediaQuery.of(context).size.height*0.06
                    )),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    )),
                    elevation: const WidgetStatePropertyAll(4)
                ),
                child: const Text('Calculate',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF)
                  ),
                )
            ),

            const SizedBox(height: 10),

            Consumer<TripProvider>(
              builder: (context, tripProvider, child){
                if(!tripProvider.hasCalculated){
                  return const SizedBox();
                }
                return Container(
                  width: double.infinity,
                  color: Color(0xFFF7F9FC),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Result',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF3366FF),
                        ),
                      ),
                      Text('Mileage: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3366FF),
                        ),
                      ),
                      Text('${tripProvider.mileage.toString()} Km/l',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Text('Fuel Economy: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3366FF),
                        ),
                      ),
                      Text('Rs. ${tripProvider.fuelEconomy.toString()} ',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Text('Distance Travelled: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3366FF),
                        ),
                      ),
                      Text('${tripProvider.distance.toString()} Km',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF000000),
                        ),
                      ),
                      Text('Total Fuel Cost: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3366FF),
                        ),
                      ),
                      Text('Rs. ${tripProvider.totalFuelCost.toString()}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

}
