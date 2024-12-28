import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hugeicons/hugeicons.dart';
import 'home_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('user')
          .where('username', isEqualTo: _usernameController.text)
          .where('password', isEqualTo: _passwordController.text)
          .get();

      if (snapshot.docs.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        _showSnackBar('Username atau Password salah');
      }
    } catch (e) {
      _showSnackBar('Terjadi kesalahan: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildHeader(),
                _buildUsernameField(),
                _buildPasswordField(),
                _buildForgotPasswordButton(),
                SizedBox(height: 20),
                _isLoading ? CircularProgressIndicator() : _buildLoginButton(),
              ],
            ),
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
              color: Color(0xFF002244),
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
      iconColor: Color(0xFF002244),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Username tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return _buildTextField(
      controller: _passwordController,
      labelText: 'Password',
      icon: HugeIcons.strokeRoundedLockPassword,
      iconColor: Color(0xFF002244),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    required Color iconColor,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: 320,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
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

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: _login,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF002244),
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
