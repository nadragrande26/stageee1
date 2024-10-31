import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/main.dart';

class HomeController extends GetxController {
  RxString username = ''.obs; // Menyimpan username
  RxInt balance = 1000000.obs;
  var currentIndex = 0.obs; // State halaman

  void changePage(int index) {
    currentIndex.value = index;
  }

  // List contoh berita
  var news = <dynamic>[].obs;

  static const String _baseUrl = 'https://newsapi.org/v2/';
  static const String _apiKey ='ef1bf4d75637450693331c8438fdf5c0'; // Ganti dengan API key Anda
  static const String _category = 'business';
  static const String _country = 'us';

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  void fetchNews() async {
    final response = await http.get(
      Uri.parse(
          '$_baseUrl/top-headlines?country=$_country&category=$_category&apiKey=$_apiKey'),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      news.value = data['articles']; // Simpan berita di state
    } else {
      Get.snackbar('Error', 'Gagal mengambil data berita.');
    }
  }

  // List contoh UMKM
  RxList<UMKM> umkms = <UMKM>[
    UMKM(
        name: 'UMKM A: Makanan Sehat',
        location: 'Jakarta',
        performance: 'Baik'),
    UMKM(
        name: 'UMKM B: Produk Kerajinan Tangan',
        location: 'Bali',
        performance: 'Sedang'),
    UMKM(
        name: 'UMKM C: Fashion Ramah Lingkungan',
        location: 'Bandung',
        performance: 'Baik'),
    UMKM(
        name: 'UMKM D: Teknologi Pertanian',
        location: 'Yogyakarta',
        performance: 'Sangat Baik'),
    UMKM(
        name: 'UMKM E: Katering Sehat',
        location: 'Surabaya',
        performance: 'Baik'),
  ].obs;
}