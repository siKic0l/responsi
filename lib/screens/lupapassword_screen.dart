import 'package:flutter/material.dart';

class LupapasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _sendResetLink(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Link pemulihan telah dikirim ke email Anda'),
        ),
      );

      // Navigasi kembali ke layar login setelah kirim
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 84),
                // Logo dan teks "Responsi 2024"
                Center(
                  child: SizedBox(
                    width: 252,
                    height: 96,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          child: Container(
                            width: 102,
                            height: 96,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 108,
                          top: 26,
                          child: Text(
                            'Responsi',
                            style: TextStyle(
                              fontFamily: 'Post No Bills Colombo',
                              fontWeight: FontWeight.w800,
                              fontSize: 30,
                              letterSpacing: 2.4,
                              color: Color(0xCC000000),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 113,
                          top: 69,
                          child: Text(
                            '2024',
                            style: TextStyle(
                              fontFamily: 'Post No Bills Colombo',
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                              letterSpacing: 0.96,
                              color: Color(0xE5000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                const Center(
                  child: Text(
                    'Lupa Password',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2.56,
                      color: Color(0xE5000000),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Pesan',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Masukan email Anda dan tunggu kode pemulihan akan dikirimkan.',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 24),
                // Email Input
                const Text(
                  'Masukan Email',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                Container(
                  height: 43,
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      border: InputBorder.none,
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF736A6A),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Format email tidak valid';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 80),
                // Tombol Kirim
                Center(
                  child: GestureDetector(
                    onTap: () => _sendResetLink(context),
                    child: Container(
                      width: 218,
                      height: 55,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4285F4),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Kirim',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.92,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
