import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentimentai/presentation/bloc/home_bloc.dart';
import 'package:sentimentai/presentation/bloc/home_event.dart';
import 'package:sentimentai/presentation/bloc/home_state.dart';
import 'package:sentimentai/presentation/screens/about_screen.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;

late tfl.Interpreter interpreter;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
              colors: [
                (state is HomePositive
                    ? const Color(0xFF34A753)
                    : state is HomeNegative
                        ? const Color(0xFFE94335)
                        : const Color(0xFF4285F3)),
                Colors.transparent
              ],
              center: Alignment.topLeft,
              radius: MediaQuery.of(context).size.width * 0.0035),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: FloatingActionButton.extended(
            icon: Icon(Icons.sentiment_satisfied_alt_rounded),
            label: Text('Analyze'),
            onPressed: () {
              context
                  .read<HomeBloc>()
                  .add(OnTextChanged(textEditingController.text));
            },
            tooltip: 'Analyze',
          ),
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AboutScreen(),
                    ));
                  },
                  icon: Icon(Icons.developer_board_rounded))
            ],
            elevation: 0,
            backgroundColor: Colors.transparent,
            // title: Text(
            //   'SentimentAI',
            //   style: Theme.of(context).textTheme.displaySmall,
            // ),
            title: Image.asset(
              'assets/logo.png',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: TextField(
                    maxLines: null,
                    expands: true,
                    controller: textEditingController,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontFamily: GoogleFonts.robotoMono().fontFamily),
                    decoration: const InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      hintText: 'Start typing..',
                    ),
                    maxLength: 200,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
