import '../models/member_oop.dart';

// Daftar ini sekarang berfungsi sebagai "Pemain di Bursa Transfer"
// dan hanya berisi objek Player.
final List<Player> playersForSale = [
  Player(
    name: 'Kairi',
    ign: 'Kairi',
    role: 'Jungler',
    imagePath: 'assets/images/kairi.png',
    fullName: 'Kairi Ygnacio Rayosdelsol',
    nationality: 'Filipina',
    signatureHeroes: ['Ling', 'Fanny', 'Hayabusa'],
    rating: 4.9,
    price: 150000000, // Harga dalam Rupiah
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
    price: 120000000, // Harga dalam Rupiah
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
      price: 135000000, // Harga dalam Rupiah
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
    price: 95000000, // Harga dalam Rupiah
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
    price: 80000000,
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
    price: 110000000,
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
    price: 75000000,
    funFact:
    'Rookie yang menjanjikan dari tim MDL. Sebelum naik ke MPL, ia telah menunjukkan bakatnya dengan meraih gelar Finals MVP di Liga Esports Nasional 2024.',
    achievements: ['MPL Indonesia (S15)'],
  ),
];

