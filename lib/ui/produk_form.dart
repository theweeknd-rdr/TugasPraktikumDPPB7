import 'package:flutter/material.dart';

class ProdukForm extends StatefulWidget {
  const ProdukForm({Key? key}) : super(key: key);
  @override
  _ProdukFormState createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _kodeProdukController = TextEditingController();
  final _namaProdukController = TextEditingController();
  final _hargaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar transparan agar menyatu dengan background
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Form Produk",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4facfe), // Biru muda cerah
              Color(0xFF00f2fe), // Cyan cerah
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            24,
            100,
            24,
            24,
          ), // Padding atas lebih besar karena AppBar transparan
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Tambah Data",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Input Kode Produk
                  _buildTextField(
                    controller: _kodeProdukController,
                    label: "Kode Produk",
                    icon: Icons.qr_code,
                  ),
                  const SizedBox(height: 20),

                  // Input Nama Produk
                  _buildTextField(
                    controller: _namaProdukController,
                    label: "Nama Produk",
                    icon: Icons.shopping_bag_outlined,
                  ),
                  const SizedBox(height: 20),

                  // Input Harga
                  _buildTextField(
                    controller: _hargaController,
                    label: "Harga",
                    icon: Icons.attach_money,
                    isNumber: true,
                  ),
                  const SizedBox(height: 40),

                  // Tombol Simpan Modern
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Aksi simpan
                        String kode = _kodeProdukController.text;
                        String nama = _namaProdukController.text;
                        String harga = _hargaController.text;

                        print('Kode Produk: $kode');
                        print('Nama Produk: $nama');
                        print('Harga: $harga');

                        // Feedback visual
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Data $nama berhasil disimpan!"),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4facfe),
                        foregroundColor: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'SIMPAN DATA',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isNumber = false,
  }) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blueAccent, width: 1.5),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _kodeProdukController.dispose();
    _namaProdukController.dispose();
    _hargaController.dispose();
    super.dispose();
  }
}
