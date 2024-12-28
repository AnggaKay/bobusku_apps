import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  static const int splashDuration = 5; // Duration for splash screen in seconds
  static const String logoPath = 'assets/images/bus.png'; // Path to logo image
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.9, end: 1.1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundGradient(),
          Center(child: _buildSplashContent()),
        ],
      ),
    );
  }

  Widget _buildBackgroundGradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF003566), Color(0xFF4F8FF7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }

  Widget _buildSplashContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildAnimatedLogo(),
        SizedBox(height: 20),
        _buildTitle(),
        SizedBox(height: 10),
        _buildTagline(),
        SizedBox(height: 30),
        _buildLoadingIndicator(),
      ],
    );
  }

  Widget _buildAnimatedLogo() {
    return ScaleTransition(
      scale: _animation,
      child: Container(
        height: 200,
        width: 200,
        child: Center(
          child: Image.asset(
            logoPath,
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'BOBUSKU',
      style: GoogleFonts.robotoSlab(
        fontSize: 40,
        fontWeight: FontWeight.w800,
        color: Colors.white,
        letterSpacing: 2,
      ),
    );
  }

  Widget _buildTagline() {
    return Text(
      'Booking Bus Terbaik Mu, Sekarang Juga!',
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
        fontSize: 14,
        color: Colors.white70,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return CircularProgressIndicator(
      color: Colors.white,
      strokeWidth: 3,
    );
  }
}
