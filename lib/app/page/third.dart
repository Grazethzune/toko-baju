import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  String apiKey = 'AIzaSyDotgFE2L3_WY7F8ae83n2CHSPqqgrqV_I';
  String location = 'Eiffel Tower, Paris';
  Map<String, dynamic>? locationData;

  Future<void> fetchLocationData(String address) async {
    final Uri url = Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$apiKey',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'] == 'OK') {
          setState(() {
            locationData = data['results'][0]['geometry']['location'];
          });
        } else {
          throw Exception('Failed to load location');
        }
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchLocationData(location); // Mengambil lokasi saat halaman di-load
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps API Integration'),
      ),
      body: Center(
        child: locationData == null
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Location: $location',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Latitude: ${locationData!['lat']}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Longitude: ${locationData!['lng']}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
      ),
    );
  }
}
