import 'package:go_router/go_router.dart';
import 'package:onic_esports_app/models/member_oop.dart';
import '../screens/splash_screen.dart';
import '../screens/login_screen.dart';
import '../screens/welcome_screen.dart';
import '../screens/home_screen.dart';
import '../screens/marketplace_screen.dart';
import '../screens/my_team_screen.dart';
import '../screens/history_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/search_screen.dart';
import '../screens/device_info_screen.dart';
import '../screens/webview_screen.dart';
import '../screens/member_detail_screen.dart';

// Kita definisikan nama rute sebagai konstanta agar mudah dipanggil
class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String welcome = '/welcome';
  static const String home = '/home';
  static const String marketplace = '/marketplace';
  static const String myTeam = '/my-team';
  static const String history = '/history';
  static const String settings = '/settings';
  static const String search = '/search';
  static const String deviceInfo = '/info';
  static const String webview = '/webview';
  static const String playerDetail = '/player-detail';
}

// Konfigurasi utama go_router
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash, // Rute awal saat aplikasi dibuka
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.welcome,
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.marketplace,
      builder: (context, state) => const MarketplaceScreen(),
    ),
    GoRoute(
      path: AppRoutes.myTeam,
      builder: (context, state) => const MyTeamScreen(),
    ),
    GoRoute(
      path: AppRoutes.history,
      builder: (context, state) => const HistoryScreen(),
    ),
    GoRoute(
      path: AppRoutes.settings,
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: AppRoutes.search,
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: AppRoutes.deviceInfo,
      builder: (context, state) => const DeviceInfoScreen(),
    ),
    // Rute yang menerima data (parameter)
    GoRoute(
      path: AppRoutes.webview,
      builder: (context, state) {
        // Ambil data 'extra' yang dikirim
        final params = state.extra as Map<String, String>;
        return WebViewScreen(
          title: params['title']!,
          url: params['url']!,
        );
      },
    ),
    GoRoute(
      path: AppRoutes.playerDetail,
      builder: (context, state) {
        // Ambil objek Player yang dikirim via 'extra'
        final player = state.extra as Player;
        return MemberDetailScreen(member: player);
      },
    ),
  ],
);