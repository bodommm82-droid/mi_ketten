import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../providers/user_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bejelentkezés")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Jelszó"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      final userProvider = context.read<UserProvider>();
                      final messenger = ScaffoldMessenger.of(context);
                      final router = GoRouter.of(context);

                      setState(() => _isLoading = true);

                      final success = await userProvider.signIn(
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
                      );

                      if (!mounted) return;
                      setState(() => _isLoading = false);

                      if (success) {
                        router.go('/game');
                      } else {
                        messenger.showSnackBar(
                          const SnackBar(
                              content: Text("Sikertelen bejelentkezés!")),
                        );
                      }
                    },
                    child: const Text("Belépés"),
                  ),
            TextButton(
              onPressed: () => context.go('/register'),
              child: const Text("Még nincs fiókod? Regisztrálj!"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
