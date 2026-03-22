import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';

  Future<List<Product>> fetchProducts() async {
    const int maxRetries = 3;
    int retryCount = 0;

    while (retryCount < maxRetries) {
      try {
        final response = await http
            .get(Uri.parse('$baseUrl/products'))
            .timeout(const Duration(seconds: 10));

        if (response.statusCode == 200) {
          final List<dynamic> data = json.decode(response.body);
          return data.map((json) => Product.fromJson(json)).toList();
        } else {
          throw Exception('Gagal memuat produk (Status: ${response.statusCode})');
        }
      } on SocketException catch (_) {
        retryCount++;
        if (retryCount >= maxRetries) {
          throw Exception('Gagal terhubung ke internet. Periksa koneksi koneksi jaringan Anda.');
        }
        await Future.delayed(Duration(seconds: retryCount * 2));
      } on TimeoutException catch (_) {
        retryCount++;
        if (retryCount >= maxRetries) {
          throw Exception('Koneksi lambat (Timeout). Silakan coba lagi nanti.');
        }
        await Future.delayed(Duration(seconds: retryCount * 2));
      } catch (e) {
        // For other unknown exceptions, fail immediately or throw
        throw Exception('Terjadi kesalahan: $e');
      }
    }
    
    throw Exception('Terjadi kesalahan yang tidak dketahui.');
  }
}
