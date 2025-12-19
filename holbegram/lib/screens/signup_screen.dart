import 'package:flutter/material.dart';
import '../widgets/text_field.dart';
import 'login_screen.dart';

class SignUp extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmController;

  final bool _passwordVisible;

  const SignUp({
    super.key,
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
    required this.passwordConfirmController,
    bool passwordVisible = true,
  }) : _passwordVisible = passwordVisible;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = widget._passwordVisible;
  }

  @override
  void dispose() {
    widget.emailController.dispose();
    widget.usernameController.dispose();
    widget.passwordController.dispose();
    widget.passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 28),
                    const Text(
                      'Holbegram',
                      style: TextStyle(
                        fontFamily: 'Billabong',
                        fontSize: 50,
                      ),
                    ),
                    Image.asset(
                      'assets/images/logo.webp',
                      width: 80,
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 12),
                          const Text(
                            'Sign up to see photos and videos\nfrom your friends.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 28),

                          TextFieldInput(
                            controller: widget.emailController,
                            ispassword: false,
                            hintText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 24),

                          TextFieldInput(
                            controller: widget.usernameController,
                            ispassword: false,
                            hintText: 'Full Name',
                            keyboardType: TextInputType.text,
                          ),
                          const SizedBox(height: 24),

                          TextFieldInput(
                            controller: widget.passwordController,
                            ispassword: !_passwordVisible,
                            hintText: 'Password',
                            keyboardType: TextInputType.visiblePassword,
                            suffixIcon: IconButton(
                              alignment: Alignment.bottomLeft,
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: const Color.fromARGB(218, 226, 37, 24),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),

                          TextFieldInput(
                            controller: widget.passwordConfirmController,
                            ispassword: !_passwordVisible,
                            hintText: 'Confirm Password',
                            keyboardType: TextInputType.visiblePassword,
                            suffixIcon: IconButton(
                              alignment: Alignment.bottomLeft,
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: const Color.fromARGB(218, 226, 37, 24),
                              ),
                            ),
                          ),

                          const SizedBox(height: 28),

                          SizedBox(
                            height: 48,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  const Color.fromARGB(218, 226, 37, 24),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Sign up',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),
                          const Divider(thickness: 2),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Have an account?'),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => LoginScreen(
                                          emailController: TextEditingController(),
                                          passwordController: TextEditingController(),
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Log in',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(218, 226, 37, 24),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}