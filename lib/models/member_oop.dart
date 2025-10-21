// File ini mendefinisikan struktur data untuk anggota tim dengan konsep OOP.

// Kelas dasar abstrak untuk semua anggota tim
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

  // Metode abstrak untuk Polymorphism
  String getDisplayRole();
}

// Kelas Player mewarisi dari TeamMember dan menambahkan properti harga
class Player extends TeamMember {
  final String role;
  final List<String> signatureHeroes;
  final double rating;
  final int price; // Properti baru untuk harga pemain

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
    required this.rating,
    required this.price, // Ditambahkan di constructor
  });

  @override
  String getDisplayRole() {
    return "Role: $role";
  }
}

// Kelas Coach (tidak memiliki harga karena tidak dijual di marketplace)
class Coach extends TeamMember {
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

  @override
  String getDisplayRole() {
    return "Jabatan: Pelatih Utama";
  }
}

