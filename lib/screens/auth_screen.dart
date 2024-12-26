import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';
import 'package:hugeicons/hugeicons.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildHeader(),
              _buildUsernameField(),
              _buildPasswordField(),
              _buildForgotPasswordButton(),
              SizedBox(height: 20),
              _buildLoginButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Image.asset('assets/images/bus.png', height: 200, width: 200),
          SizedBox(height: 20),
          Text(
            'Enter your information',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 111, 214),
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Fill up your personal information for seamless experience in bobusku',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildUsernameField() {
    return _buildTextField(
      controller: _usernameController,
      labelText: 'Username',
      icon: HugeIcons.strokeRoundedUser,
      iconColor: Color.fromARGB(255, 0, 79, 154),
    );
  }

  Widget _buildPasswordField() {
    return _buildTextField(
      controller: _passwordController,
      labelText: 'Password',
      icon: HugeIcons.strokeRoundedLockPassword,
      iconColor: Color.fromARGB(255, 0, 97, 188),
      obscureText: true,
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    required Color iconColor,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: 320,
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: Icon(icon, color: iconColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // Aksi untuk lupa kata sandi
        },
        child: Text(
          'Lupa Kata Sandi',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(210, 0, 154, 250),
        padding: EdgeInsets.symmetric(horizontal: 130),
        textStyle: TextStyle(fontSize: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Text('Masuk', style: TextStyle(color: Colors.white)),
    );
  }
}
