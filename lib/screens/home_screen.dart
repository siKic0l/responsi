import 'package:flutter/material.dart';
import 'package:route_flutter/screens/login_screen.dart';
import 'package:route_flutter/screens/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onItemTapped(BuildContext context, int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 44),
              _buildTopAppBar(),
              const SizedBox(height: 24),
              const Text(
                'Widget Grid View',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                  height: 1.27,
                  color: Color(0xFF1D1B20),
                ),
              ),
              const SizedBox(height: 16),
              _buildGridViewSection(),
              const SizedBox(height: 24),
              const Text(
                'Widget List View',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                  height: 1.27,
                  color: Color(0xFF1D1B20),
                ),
              ),
              const SizedBox(height: 16),
              _buildListViewSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }

  Widget _buildTopAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildIconButton(const Icon(Icons.person)),
        const Text(
          'Guest',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontSize: 24,
            height: 1.33,
            color: Color(0xFF1D1B20),
          ),
        ),
        Row(
          children: [
            _buildIconButton(const Icon(Icons.notifications)),
            _buildIconButton(const Icon(Icons.settings)),
          ],
        ),
      ],
    );
  }

  Widget _buildIconButton(Icon icon) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: icon,
    );
  }

  Widget _buildGridViewSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(5, (index) => _buildCard()),
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      width: 132,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFECE6F0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            'Artist',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              height: 1.43,
              color: Color(0xFF1D1B20),
            ),
          ),
          const Text(
            'Song',
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

  Widget _buildListViewSection() {
    return Column(
      children: List.generate(2, (index) => _buildListItem()),
    );
  }

  Widget _buildListItem() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F2FA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: NetworkImage('https://placeholder.pics/svg/120x120'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Headline',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                    height: 1.27,
                    color: Color(0xFF1D1B20),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Description duis aute irure dolor in reprehenderit in voluptate velit.',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.43,
                    color: Color(0xFF49454F),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    Icon(Icons.calendar_today, size: 16),
                    SizedBox(width: 4),
                    Text(
                      'Today • 23 min',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        height: 1.33,
                        color: Color(0xFF49454F),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
