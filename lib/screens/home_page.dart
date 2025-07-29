import 'package:flutter/material.dart';
import 'package:fuel_mileage_tracker/screens/historyPage.dart';
import 'package:fuel_mileage_tracker/screens/settings.dart';
import 'package:fuel_mileage_tracker/widgets/vehicle_input_card.dart';

enum VehicleType { car, bike, truck }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VehicleType selectedVehicle = VehicleType.car;

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning!';
    if (hour < 17) return 'Good Afternoon!';
    return 'Good Evening!';
  }

  Widget buildVehicleButton(VehicleType type, IconData icon) {
    bool isSelected = selectedVehicle == type;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedVehicle = type;
        });
      },
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? const Color(0xFF3366FF): Colors.transparent,
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(
              icon,
              size: isSelected ? 36 : 28,
              color: isSelected ? const Color(0xFFFFFFFF):const Color(0xFF3366FF),
            ),
          ),
          const SizedBox(height: 6),
          AnimatedContainer(
            height: 3,
            width: isSelected ? 40 : 0,
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFF3366FF),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F9FC),
        elevation: 0,
        title: Row(
          children: [
            const Image(
              image: AssetImage('assets/images/applogo.png'),
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 10),
            const Text(
              'Tracker',
              style: TextStyle(
                color: Color(0xFF1E2A39),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            CircleAvatar(
              backgroundColor: const Color(0xFF3366FF),
              radius: 20,
              child: IconButton(
                  onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (_)=> SettingsPage())),
                  icon: const Icon(Icons.person), 
                  color: Colors.white
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFFF7F9FC),
              ),
              child: Column(
                children: [
                  Text(
                    greeting(),
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3366FF),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Fuel Expense and Mileage Tracker',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF3366FF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height*0.005),

            Card(
              color: const Color(0xFFF7F9FC),
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildVehicleButton(VehicleType.car, Icons.directions_car),
                        buildVehicleButton(VehicleType.bike, Icons.directions_bike),
                        buildVehicleButton(VehicleType.truck, Icons.fire_truck),
                      ],
                    ),
                    // SizedBox(height: 5,),
                    VehicleInputCard(vehicleType: selectedVehicle),

                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Card(
                color: const Color(0xFFF7F9FC),
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: const Icon(Icons.history_sharp,
                      color: Color(0xFF3366FF),
                    ),
                    title: const Text('Show History',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF3366FF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const Icon(Icons.navigate_next_sharp,
                      color: Color(0xFF3366FF),
                    ),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=> HistoryScreen()));
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            )

          ],
        ),
      ),
    );
  }
}
