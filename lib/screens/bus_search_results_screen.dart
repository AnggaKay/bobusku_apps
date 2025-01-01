import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:hugeicons/hugeicons.dart';
import 'bus_detail_screen.dart';

class BusSearchResultsScreen extends StatelessWidget {
  final String fromCity;
  final String toCity;
  final String selectedDate;

  BusSearchResultsScreen({
    required this.fromCity,
    required this.toCity,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FA),
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(child: _buildBusList(context)),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 80,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Color(0xFF1C3FAA)),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                fromCity.toUpperCase(),
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C3FAA),
                ),
              ),
              SizedBox(width: 8),
              Icon(HugeIcons.strokeRoundedArrowLeftRight,
                  color: Color(0xFF1C3FAA), size: 22),
              SizedBox(width: 8),
              Text(
                toCity.toUpperCase(),
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C3FAA),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            selectedDate,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1C3FAA), Color(0xFF4F8FF7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Available Buses",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Icon(HugeIcons.strokeRoundedFilter, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildBusList(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemBuilder: (context, index) {
        return _buildBusCard(context, index);
      },
    );
  }

  Widget _buildBusCard(BuildContext context, int index) {
    final busName = index % 2 == 0 ? 'PT Azril' : 'PO Mas Andre';
    final busClass =
        index % 2 == 0 ? 'Executive Class (2+2)' : 'VIP Class (2+1)';
    final price = index % 2 == 0 ? 250000 : 300000;
    final tag = index % 2 == 0 ? 'TERMURAH' : 'TERCEPAT';
    final tagColor = index % 2 == 0 ? Colors.green : Colors.blue;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BusDetailScreen(
              busName: busName,
              departureTime: '06:00 AM',
              arrivalTime: '02:30 PM',
              fromCity: fromCity,
              toCity: toCity,
              price: price,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBusInfo(busName, busClass, tag, tagColor),
            SizedBox(height: 12),
            _buildBusSchedule(),
            Divider(color: Colors.grey[300]),
            _buildBusFooter(price),
          ],
        ),
      ),
    );
  }

  Widget _buildBusInfo(
      String busName, String busClass, String tag, Color tagColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              busName,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C3FAA),
              ),
            ),
            SizedBox(height: 4),
            Text(
              busClass,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: tagColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            tag,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBusSchedule() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '06:00 AM',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Lampung - Jakarta',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(HugeIcons.strokeRoundedBus01,
                  color: Color(0xFF1C3FAA), size: 30),
              SizedBox(height: 4),
              Text(
                '3h 30m',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBusFooter(int price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(HugeIcons.strokeRoundedStar, color: Colors.amber, size: 20),
            SizedBox(width: 4),
            Text(
              '4.5',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(width: 12),
            Icon(HugeIcons.strokeRoundedUserMultiple,
                color: Colors.red, size: 20),
            SizedBox(width: 4),
            Text(
              '45',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        Text(
          NumberFormat.currency(locale: 'id', symbol: 'Rp ').format(price),
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1C3FAA),
          ),
        ),
      ],
    );
  }
}
