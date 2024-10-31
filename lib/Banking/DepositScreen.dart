import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/Controller/HomeController.dart';


class DepositScreen extends StatelessWidget {
  final HomeController homeController =
      Get.find<HomeController>(); // Mengambil instance HomeController
  final TextEditingController amountController = TextEditingController();
  XFile? imageFile; // Menyimpan file gambar yang dipilih

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    imageFile = await picker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      Get.snackbar('Sukses', 'Gambar berhasil dipilih: ${imageFile!.name}');
    } else {
      Get.snackbar('Error', 'Gambar tidak dipilih!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deposit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: 'Jumlah Deposit',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage, // Panggil fungsi untuk memilih gambar
              child: const Text('Pilih Bukti Deposit'),
            ),
            const SizedBox(height: 20),
            if (imageFile != null) // Tampilkan gambar jika ada
              Column(
                children: [
                  Image.file(
                    File(imageFile!.path),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ElevatedButton(
              onPressed: () {
                // Logika deposit
                if (amountController.text.isNotEmpty && imageFile != null) {
                  int amount = int.parse(amountController.text);
                  homeController.balance.value += amount; // Menambahkan saldo
                  Get.back(); // Kembali ke halaman utama
                  Get.snackbar('Sukses', 'Deposit berhasil sebesar Rp $amount');
                } else {
                  Get.snackbar('Error',
                      'Masukkan jumlah yang valid dan pilih gambar bukti deposit!');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Deposit'),
            ),
          ],
        ),
      ),
    );
  }
}
