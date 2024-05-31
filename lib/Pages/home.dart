import 'package:flutter/material.dart';
import 'package:weather_app/Pages/landing_page.dart';
import 'package:weather_app/Pages/weather_page.dart';
import 'package:weather_app/util/countrydropdown.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 bool Radiovalue=false;
 String? address;
 String? pos;
 Position? position;
 String? country;
 Future<Position?> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  print("Location services enabled: $serviceEnabled");//debug
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    print("Location services are disabled.");//debug
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  print("Location permission status: $permission"); //debug
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      print("Location permissions are denied.");//debug
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    print("Location permissions are permanently denied.");//debug
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  
  
      Position p= await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high, timeLimit: Duration(seconds: 30));
      print("Position obtained: $position");//debug
      setState(() {
        position= p;
      });
      return position;

}

UseMyLocation(bool? newvalue) async {
      print("Toggling location usage...");//debug
  setState(() {
      Radiovalue = !Radiovalue;
    });
    
  // Position position=await _determinePosition();
  // List po= position as List;
  // pos=po[0].toString();
  // List pm= await placemarkFromCoordinates(position.latitude, position.longitude);
  // address=pm[0].toString();
   try {
      
      Position? position = await _determinePosition();
      setState(() {
        pos = "Latitude: ${position?.latitude}, Longitude: ${position?.longitude}";
        if(pos != null){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const WeatherPage()));
        }
      });

      List<Placemark> placemarks = await placemarkFromCoordinates(position!.latitude, position.longitude);
      print("placemarks: $placemarks");//debug
      
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        setState(() {
          country="${placemark.country}";
          //address = "${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, "${placemark.country}";
        });
      } else {
        setState(() {
          address = "No address available";
        });
      }
    } catch (e) {
      print("ERROR: $e");//debug
      setState(() {
        pos = "Error: ${e.toString()}";
        address = "Error retrieving address";
      });
    }
    
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(28),
        child: AppBar(
          backgroundColor: Colors.black,
          leading:IconButton(
            icon:const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const LandingPage()));
          },
          color: Colors.white),
        ),
      ),
      body: Center(
        child: Stack(
          children: [                  
                 Padding(
                   padding: const EdgeInsets.only(left: 70.0, top: 70.0),
                   child: ClipRRect(
                    borderRadius: BorderRadius.circular(270),
                     child: Image.asset(
                       'lib/Images/Logo.png',
                        height: 200,
                        width: 200,
                        ),
                   ),
                 ),
                                                   
                 Padding(
                 padding: const EdgeInsets.all(30.0),            
                    child: Container(
                      height: 1000,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                        color: Colors.white,
                        width: 1, // Adjust the width of the glowing border
                      ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.04), // Adjust the opacity if needed
                            blurRadius: 20,
                            spreadRadius: 10,
                          ),
                        ],                      
                      ),
                      alignment: Alignment.center,
                      
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         
                          const Text(
                            'Location',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),),
                            Container(
                              width: 160,
                              height: 1, // Adjust the height of the line as needed
                              color: Colors.white, // Adjust the color of the line as needed
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio(
                                  value: Radiovalue,
                                  groupValue: true,
                                  onChanged:UseMyLocation,
                                  activeColor: Colors.white,
                                ),
                                const Text(
                                  'My Location', 
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Expanded(child: Text(pos ?? "", style: const TextStyle(color: Colors.white),))],),
                            const Padding(
                              padding: EdgeInsets.only (left:35.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Country_dropdownbtn()
                                ],
                              ),
                              
                            )
                        ],
                      ),
                    ),
                  
                ),
              
              
          ],
        ),
      ),


    );
  }
} 