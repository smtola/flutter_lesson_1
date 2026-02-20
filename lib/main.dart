import 'package:flutter/material.dart';

void main() {
  runApp(const Home()); // ✅ Add const
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/profile': (context) => const ProfilePage(), // ✅ Add const
      },
    );
  }
}

// Home Page
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Demo Flutter")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Item 1"),
            onTap: () => Navigator.pushNamed(context, '/profile'), // ✅ Navigate
          ),
          ListTile(
            title: const Text("Item 2"),
            onTap: () => Navigator.pushNamed(context, '/profile'),
          ),
          ListTile(
            title: const Text("Item 3"),
            onTap: () => Navigator.pushNamed(context, '/profile'),
          ),
        ],
      ),
    );
  }
}

// Profile Page
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key}); // ✅ Add const

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
            ),
            const SizedBox(height: 20),
            const Text("Tola", style: TextStyle(fontSize: 22)),
            const Text("tola@email.com"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context), // ✅ Go back
              child: const Text("Edit Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
