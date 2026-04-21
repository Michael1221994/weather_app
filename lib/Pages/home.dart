import 'package:flutter/material.dart';
import 'package:weather_app/Pages/landing_page.dart';
import 'package:weather_app/Pages/weather_page.dart';
import 'package:weather_app/util/countrydropdown.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  static String? city;
  bool Radiovalue = false;
  String? address;
  String? pos;
  Position? position;
  String? country;

  Future<Position?> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print("Location services enabled: $serviceEnabled"); //debug
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      print("Location services are disabled."); //debug
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
        print("Location permissions are denied."); //debug
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      print("Location permissions are permanently denied."); //debug
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    Position p = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 30));
    print("Position obtained: $position"); //debug
    setState(() {
      position = p;
    });
    return position;
  }

  UseMyLocation(bool? newvalue) async {
    print("Toggling location usage..."); //debug
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
        pos =
            "Latitude: ${position?.latitude}, Longitude: ${position?.longitude}";
        if (pos != null) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WeatherPage()));
        }
      });

      List<Placemark> placemarks = await placemarkFromCoordinates(
          position!.latitude, position.longitude);
      print("placemarks: $placemarks"); //debug

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        setState(() {
          country = "${placemark.country}";
          city = "${placemark.subAdministrativeArea}";
          //address = "${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, "${placemark.country}";
        });
      } else {
        setState(() {
          address = "No address available";
        });
      }
    } catch (e) {
      print("ERROR: $e"); //debug
      setState(() {
        pos = "Error: ${e.toString()}";
        address = "Error retrieving address";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 68, 26, 1),
              Color.fromARGB(244, 82, 66, 3),
              Color.fromARGB(255, 65, 62, 224),
              Color.fromARGB(255, 2, 40, 145)
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                child: Row(children: [
                  IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LandingPage()));
                      },
                      color: Colors.white),
                ]),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(maxWidth: 420),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 0.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.04),
                            blurRadius: 20,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 28.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.cloud,
                              size: 72,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Location',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              width: 160,
                              height: 1,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio(
                                  value: Radiovalue,
                                  groupValue: true,
                                  onChanged: UseMyLocation,
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
                            const SizedBox(height: 12),
                            const Center(
                              child: Country_dropdownbtn(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
          ),
        ),
      ),
    );
  }
}
