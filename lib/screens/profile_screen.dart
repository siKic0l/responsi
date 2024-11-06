import 'package:flutter/material.dart';
import 'package:route_flutter/screens/editProfil.dart';
import 'package:route_flutter/screens/login_screen.dart';
import 'package:route_flutter/screens/home_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Fungsi untuk navigasi ketika item BottomNavigationBar dipilih
  void _onItemTapped(BuildContext context, int index) {
    if (index == 0) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (route) => false,
      );
    } else if (index == 2) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 44),
              _buildProfileCard(),
              const SizedBox(height: 24),
              _buildSectionHeader('Kelola Akun', Icons.arrow_forward, context),
              _buildSectionHeader('Notifikasi', Icons.arrow_forward, context),
              _buildSectionHeader(
                  'Privacy Policy', Icons.arrow_forward, context),
              _buildSectionHeader(
                  'Terms of Service', Icons.arrow_forward, context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  // Widget untuk menampilkan profil
  Widget _buildProfileCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFECE6F0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 116,
            height: 119,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: NetworkImage('https://placeholder.pics/svg/116x119'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Nama Lengkap',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              height: 1.43,
              color: Color(0xFF1D1B20),
            ),
          ),
          const Text(
            'Asal Universitas',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              height: 1.33,
              color: Color(0xFF49454F),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk setiap header section (Kelola Akun, Notifikasi, dll)
  Widget _buildSectionHeader(
      String title, IconData icon, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman EditProfil hanya jika 'Kelola Akun' dipilih
        if (title == 'Kelola Akun') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditProfil()),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F2FA),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 22,
                height: 1.27,
                color: Color(0xFF1D1B20),
              ),
            ),
            Icon(icon),
          ],
        ),
      ),
    );
  }

  // BottomNavigationBar dengan tiga item untuk navigasi
  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFFF3EDF7),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Akun",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.exit_to_app),
          label: "Logout",
        ),
      ],
      onTap: (index) => _onItemTapped(context, index),
    );
  }
}
