import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/app_router.dart';
import 'cubit/team_cubit.dart';

// 1. TAMBAHKAN IMPORT INI
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {

  // 2. TAMBAHKAN BARIS INI (SEBELUM runApp)
  usePathUrlStrategy();

  // Kode Anda yang lain biarkan saja
  initializeDateFormatting('id_ID', null).then((_) {
    runApp(
      BlocProvider(
        create: (context) => TeamCubit(),
        child: const OnicEsportsApp(),
      ),
    );
  });
}

class OnicEsportsApp extends StatelessWidget {
  // ... sisa kode Anda tetap sama ...
  const OnicEsportsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'ONIC Esports Marketplace',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        brightness: Brightness.dark,
        fontFamily: 'Montserrat',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}