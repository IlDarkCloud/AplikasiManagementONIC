import '../models/member_oop.dart'; // Perbaikan ada di baris ini

// Daftar ini berisi semua data anggota tim, baik pemain maupun pelatih.
final List<TeamMember> onicTeamMembers = [
  // --- DAFTAR PEMAIN ---
  Player(
    name: 'Kairi',
    ign: 'Kairi',
    role: 'Jungler',
    imagePath: 'assets/images/kairi.png',
    fullName: 'Kairi Ygnacio Rayosdelsol',
    nationality: 'Filipina',
    signatureHeroes: ['Ling', 'Fanny', 'Hayabusa'],
    rating: 4.9,
    funFact:
    'Dianggap sebagai salah satu transfer tersukses dalam sejarah MPL ID. Kedatangannya dari ONIC PH pada tahun 2022 menjadi pilar utama dimulainya dinasti baru ONIC.',
    achievements: [
      'MPL Indonesia (S10, S11, S12, S15)',
      'MSC (2023)',
      'Snapdragon Pro Series S3 SEA'
    ],
  ),
  Player(
    name: 'Sanz',
    ign: 'S A N Z',
    role: 'Mid Laner',
    imagePath: 'assets/images/sanz.png',
    fullName: 'Gilang',
    nationality: 'Indonesia',
    signatureHeroes: ['Pharsa', 'Yve', 'Valentina'],
    rating: 4.8,
    funFact:
    'Salah satu pilar terlama di era modern ONIC. Sanz telah menjadi motor serangan tim sejak kedatangannya pada MPL ID S6 dan konsisten meraih gelar individu.',
    achievements: [
      'MPL Indonesia (S8, S10, S11, S12, S15)',
      'MSC (2023)',
      'ONE Esports MPLI (2021)'
    ],
  ),
  Player(
      name: 'Kiboy',
      ign: 'Kiboy',
      role: 'Roamer',
      imagePath: 'assets/images/kiboy.png',
      fullName: 'Nicky Fernando Pontonuwu',
      nationality: 'Indonesia',
      signatureHeroes: ['Chou', 'Kaja', 'Franco'],
      rating: 4.8,
      funFact:
      'Produk asli dari pengembangan ONIC Prodigy (MDL). Gaya bermainnya yang agresif membuatnya menjadi Roamer terbaik Indonesia dan meraih gelar MVP Final di MSC 2023.',
      achievements: [
        'MPL Indonesia (S8, S10, S11, S12, S15)',
        'MSC (2023)',
        'ONE Esports MPLI (2021)'
      ]),
  Player(
    name: 'CW',
    ign: 'CW',
    role: 'Gold Laner',
    imagePath: 'assets/images/cw.png',
    fullName: 'Calvin Winata',
    nationality: 'Indonesia',
    signatureHeroes: ['Beatrix', 'Claude', 'Brody'],
    rating: 4.7,
    funFact:
    'Gold Laner yang sangat konsisten dan menjadi bagian penting dari banyak gelar juara ONIC berkat positioning-nya yang solid dalam team fight.',
    achievements: [
      'MPL Indonesia (S8, S10, S11, S12, S15)',
      'MSC (2023)',
      'ONE Esports MPLI (2021)'
    ],
  ),
  Player(
    name: 'Lutpiii',
    ign: 'Lutpiii',
    role: 'EXP Laner',
    imagePath: 'assets/images/lutpiii.png',
    fullName: 'Moch Lutfi Ardianto',
    nationality: 'Indonesia',
    signatureHeroes: ['Paquito', 'Yu Zhong', 'Arlott'],
    rating: 4.6,
    funFact:
    'Talenta muda yang dipromosikan dari ONIC Prodigy. Ia dengan cepat beradaptasi di panggung MPL dan menunjukkan potensi besar sebagai penerus di EXP Lane ONIC.',
    achievements: ['MPL Indonesia (S15)'],
  ),
  Player(
    name: 'Skylar',
    ign: 'Skylar',
    role: 'Gold Laner',
    imagePath: 'assets/images/skylar.png',
    fullName: 'Schevenko David Tendean',
    nationality: 'Indonesia',
    signatureHeroes: ['Claude', 'Beatrix', 'Irithel'],
    rating: 4.7,
    funFact:
    'Bergabung dengan ONIC pada Agustus 2025 setelah menjadi ikon untuk tim rival RRQ. Transfer ini mengejutkan banyak pihak dan Skylar langsung menunjukkan kemampuannya.',
    achievements: ['MPL Indonesia (S15)'],
  ),
  Player(
    name: 'Savero',
    ign: 'Savero',
    role: 'Gold Laner',
    imagePath: 'assets/images/savero.png',
    fullName: 'Clayton Adrielo Kuswanto',
    nationality: 'Indonesia',
    signatureHeroes: ['Karrie', 'Bruno', 'Wanwan'],
    rating: 4.5,
    funFact:
    'Rookie yang menjanjikan dari tim MDL. Sebelum naik ke MPL, ia telah menunjukkan bakatnya dengan meraih gelar Finals MVP di Liga Esports Nasional 2024.',
    achievements: ['MPL Indonesia (S15)'],
  ),

  // --- DAFTAR PELATIH ---
  Coach(
    name: 'Adi',
    ign: 'Acil',
    imagePath: 'assets/images/acil.png',
    fullName: 'Adi Syofian Asyauri',
    nationality: 'Indonesia',
    joinDate: DateTime(2025, 2, 28),
    funFact:
    'Sebelum di ONIC, ia adalah pelatih ikonik untuk tim rival RRQ. Kepindahannya ke ONIC terbukti sukses besar dan langsung memperkuat statusnya sebagai salah satu pelatih terbaik.',
    achievements: ['MPL Indonesia (S15)'],
  ),
  Coach(
    name: 'Yeb',
    ign: 'Yeb',
    imagePath: 'assets/images/yeb.png',
    fullName: 'Paul Denver Lintag Miranda',
    nationality: 'Filipina',
    joinDate: DateTime(2022, 7, 4),
    funFact:
    'Arsitek di balik dinasti baru ONIC. Datang dari Filipina bersama Kairi, strategi \'drafting\'-nya yang cerdas membuatnya dijuluki "The Master General".',
    achievements: [
      'MPL Indonesia (S10, S11, S12, S15)',
      'MSC (2023)',
      'Snapdragon Pro Series S3 SEA'
    ],
  ),
];

