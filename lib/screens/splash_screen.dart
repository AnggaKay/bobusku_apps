import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const int splashDuration = 5; // Duration for splash screen in seconds
  static const Color backgroundColor = Color(0xFF002244); // Background color
  static const String logoPath = 'assets/images/bus.png'; // Path to logo image

  @override
  void initState() {
    super.initState();
    _navigateToAuth();
  }

  Future<void> _navigateToAuth() async {
    await Future.delayed(Duration(seconds: splashDuration));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AuthScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: _buildSplashContent(),
      ),
    );
  }

  Widget _buildSplashContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildLogo(),
        SizedBox(height: 10),
        _buildTitle(),
        SizedBox(height: 5),
        _buildTagline(),
      ],
    );
  }

  Widget _buildLogo() {
    return Image.asset(
      logoPath,
      height: 200,
      width: 200,
    );
  }

  Widget _buildTitle() {
    return Text(
      'BOBUSKU',
      style: GoogleFonts.robotoSlab(
        fontSize: 40,
        fontWeight: FontWeight.w800,
        color: Colors.white,
      ),
    );
  }

  Widget _buildTagline() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Booking Bus Terbaik Mu, Sekarang Juga!',
        style: GoogleFonts.poppins(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
