import 'package:flutter/material.dart';
import '../widgets/text_field.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginScreen({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = true;

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  @override
  void dispose() {
    widget.emailController.dispose();
    widget.passwordController.dispose();
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
                          const SizedBox(height: 28),
                          TextFieldInput(
                            controller: widget.emailController,
                            ispassword: false,
                            hintText: 'Email',
                            keyboardType: TextInputType.emailAddress,
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
                                'Log in',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('Forgot your login details? '),
                              Text(
                                'Get help logging in',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Flexible(flex: 0, child: SizedBox.shrink()),
                            ],
                          ),

                          const SizedBox(height: 24),
                          const Divider(thickness: 2),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't have an account "),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SignUp(
                                          emailController: TextEditingController(),
                                          usernameController: TextEditingController(),
                                          passwordController: TextEditingController(),
                                          passwordConfirmController: TextEditingController(),
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Sign up',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(218, 226, 37, 24),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: const [
                              Flexible(child: Divider(thickness: 2)),
                              SizedBox(width: 8),
                              Text(' OR '),
                              SizedBox(width: 8),
                              Flexible(child: Divider(thickness: 2)),
                            ],
                          ),
                          const SizedBox(height: 10),

                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(

                                'https://www.gstatic.com/images/branding/product/1x/gsa_512dp.png',
                                width: 40,
                                height: 40,
                                errorBuilder: (context, error, stackTrace) {
                                  return const SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: Icon(Icons.g_mobiledata),
                                  );
                                },
                              ),
                              const SizedBox(width: 8),
                              const Text('Sign in with Google'),
                            ],
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
