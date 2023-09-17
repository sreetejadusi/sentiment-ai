import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentimentai/presentation/bloc/home_bloc.dart';
import 'package:sentimentai/presentation/screens/home_screen.dart';
import 'injector.dart' as injector;

Future<void> main() async {
  await injector.init();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => injector.instance<HomeBloc>(),
      )
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Color(0xFF4285F4),
        ),
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
    );
  }
}
