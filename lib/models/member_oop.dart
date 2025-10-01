// File ini mendefinisikan struktur data untuk anggota tim menggunakan konsep OOP.

// 1. ABSTRACT CLASS (Kelas Induk)
// Kelas dasar yang tidak bisa dibuat objeknya secara langsung.
// Ini adalah contoh ENCAPSULATION, membungkus data-data umum.
abstract class TeamMember {
  final String name;
  final String ign;
  final String imagePath;
  final String fullName;
  final String nationality;
  final String funFact;
  final List<String> achievements;

  TeamMember({
    required this.name,
    required this.ign,
    required this.imagePath,
    required this.fullName,
    required this.nationality,
    required this.funFact,
    required this.achievements,
  });

  // Metode abstrak yang WAJIB diimplementasikan oleh kelas anak.
  // Ini adalah dasar dari POLYMORPHISM.
  String getDisplayRole();
}

// 2. CHILD CLASS (Kelas Anak) - Menggunakan INHERITANCE
// Kelas Player "mewarisi" semua properti dari TeamMember.
class Player extends TeamMember {
  final String role;
  final List<String> signatureHeroes;

  Player({
    required super.name,
    required super.ign,
    required super.imagePath,
    required super.fullName,
    required super.nationality,
    required super.funFact,
    required super.achievements,
    required this.role,
    required this.signatureHeroes,
  });

  // 3. POLYMORPHISM
  // Memberikan implementasi spesifik untuk metode getDisplayRole.
  @override
  String getDisplayRole() {
    return "Role: $role";
  }
}

// CHILD CLASS lainnya yang juga menggunakan INHERITANCE
class Coach extends TeamMember {
  // Properti joinDate diubah menjadi DateTime agar bisa diformat.
  final DateTime joinDate;

  Coach({
    required super.name,
    required super.ign,
    required super.imagePath,
    required super.fullName,
    required super.nationality,
    required super.funFact,
    required super.achievements,
    required this.joinDate,
  });

  // 3. POLYMORPHISM
  // Memberikan implementasi yang berbeda untuk metode yang sama.
  @override
  String getDisplayRole() {
    return "Jabatan: Pelatih Utama";
  }
}

