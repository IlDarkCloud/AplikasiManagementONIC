// Kelas dasar yang memiliki properti umum untuk semua anggota tim.
abstract class TeamMember {
  final String name;
  final String ign;
  final String imagePath;
  final String fullName;
  final String nationality;
  final String funFact;
  final List<String> achievements; // <-- PROPERTI BARU DITAMBAHKAN

  TeamMember({
    required this.name,
    required this.ign,
    required this.imagePath,
    required this.fullName,
    required this.nationality,
    required this.funFact,
    required this.achievements, // <-- DITAMBAHKAN DI CONSTRUCTOR
  });

  String getDisplayRole();
}

// Kelas Player mewarisi dari TeamMember.
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
    required super.achievements, // <-- DITAMBAHKAN DI CONSTRUCTOR
    required this.role,
    required this.signatureHeroes,
  });

  @override
  String getDisplayRole() {
    return "Role: $role";
  }
}

// Kelas Coach juga mewarisi dari TeamMember.
class Coach extends TeamMember {
  final String joinDate;

  Coach({
    required super.name,
    required super.ign,
    required super.imagePath,
    required super.fullName,
    required super.nationality,
    required super.funFact,
    required super.achievements, // <-- DITAMBAHKAN DI CONSTRUCTOR
    required this.joinDate,
  });

  @override
  String getDisplayRole() {
    return "Jabatan: Pelatih Utama";
  }
}