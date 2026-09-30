import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../forgot_password/forgot_password.dart';
import '../grid_view/products_grid_screen.dart';
import '../../functions/validation_functions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordHidden = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement
      (
        context,
        MaterialPageRoute(
          builder: (context) => const ProductsGridScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),

            child: Form(
              key: _formKey,

              child: Column(
                children: [
                  Image.asset(
                    'assets/icons/shop_bag.png',
                    width: 120,
                    height: 120,
                  ),

                  const SizedBox(height: 20),

                  Text(
                    'ShopApp',
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF111827),
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    'Welcome Back!',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF111827),
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    'Sign in to continue',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 30),

                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    decoration: InputDecoration(
                      hintText: 'Email',

                      prefixIcon: const Icon(
                        Icons.email_outlined,
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _passwordController,
                    obscureText: _isPasswordHidden,
                    validator: validatePassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    decoration: InputDecoration(
                      hintText: 'Password',

                      prefixIcon: const Icon(
                        Icons.lock_outline,
                      ),

                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isPasswordHidden = !_isPasswordHidden;
                          });
                        },

                        icon: Icon(
                          _isPasswordHidden
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Align(
                    alignment: Alignment.centerRight,

                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPassword(),
                          ),
                        );
                      },

                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF1683F7),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  SizedBox(
                    width: double.infinity,
                    height: 52,

                    child: ElevatedButton(
                      onPressed: _login,

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1683F7),
                        foregroundColor: Colors.white,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),

                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        "Don't have an account?",
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                        ),
                      ),

                      TextButton(
                        onPressed: () {},

                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF1683F7),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}