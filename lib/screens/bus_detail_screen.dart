import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BusDetailScreen extends StatelessWidget {
  final String busName;
  final String departureTime;
  final String arrivalTime;
  final String fromCity;
  final String toCity;
  final int price;

  BusDetailScreen({
    required this.busName,
    required this.departureTime,
    required this.arrivalTime,
    required this.fromCity,
    required this.toCity,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFF002244),
        elevation: 0,
        toolbarHeight: 80,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              busName,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4),
            Text(
              '$departureTime - $arrivalTime',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$fromCity to $toCity',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Price: \u00a3$price',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '4.5',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Icon(Icons.star, color: Colors.amber, size: 24),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilterChip(
                  label:
                      Text('Booked', style: GoogleFonts.poppins(fontSize: 14)),
                  backgroundColor: Colors.red.shade100,
                  onSelected: (_) {},
                ),
                SizedBox(width: 10),
                FilterChip(
                  label: Text('Available',
                      style: GoogleFonts.poppins(fontSize: 14)),
                  backgroundColor: Colors.green.shade100,
                  onSelected: (_) {},
                ),
                SizedBox(width: 10),
                FilterChip(
                  label:
                      Text('Female', style: GoogleFonts.poppins(fontSize: 14)),
                  backgroundColor: Colors.pink.shade100,
                  onSelected: (_) {},
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Choose Your Seat',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF003566),
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: 24,
                    itemBuilder: (context, index) {
                      final isBooked = index % 8 == 0;
                      final isFemale = index % 5 == 0 && !isBooked;
                      return GestureDetector(
                        onTap: () {
                          // Handle Seat Selection
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isBooked
                                ? Colors.red.shade200
                                : isFemale
                                    ? Colors.pink.shade200
                                    : Colors.green.shade200,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sleeper, Seater',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      'S8, W11',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Confirm Seat Logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF003566),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Confirm',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
