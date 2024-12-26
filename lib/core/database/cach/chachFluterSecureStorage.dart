import 'dart:io' show Platform; // For platform-specific checks
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class SecureStorageHelper {
  SecureStorageHelper._() {
    // Initialize storage differently based on platform
    secureStorage = kIsWeb
        ? FlutterSecureStorage() // Web-compatible initialization
        : const FlutterSecureStorage(); // Default for mobile platforms
  }

  static final SecureStorageHelper _instance = SecureStorageHelper._();
  factory SecureStorageHelper() {
    return _instance;
  }

  late final FlutterSecureStorage secureStorage;

  //! Save data securely using a key
  Future<void> saveData({required String key, required String value}) async {
    await secureStorage.write(key: key, value: value);
  }

  //! Retrieve data securely using a key
  Future<String?> getData({required String key}) async {
    return await secureStorage.read(key: key);
  }

  //! Remove data securely using a key
  Future<void> removeData({required String key}) async {
    await secureStorage.delete(key: key);
  }

  //! Check if a specific key exists
  Future<bool> containsKey({required String key}) async {
    final allKeys = await secureStorage.readAll();
    return allKeys.containsKey(key);
  }

  //! Clear all stored data securely
  Future<void> clearData() async {
    await secureStorage.deleteAll();
  }

  //! Save different types of data as String
  Future<void> saveDataAsString({
    required String key,
    required dynamic value,
  }) async {
    await secureStorage.write(key: key, value: value.toString());
  }

  //! Retrieve all keys and values (for debugging)
  Future<Map<String, String>> getAllData() async {
    return await secureStorage.readAll();
  }
}
