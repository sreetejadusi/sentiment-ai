import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: RadialGradient(
              colors: [Color.fromARGB(255, 152, 192, 255), Colors.transparent],
              center: Alignment.topLeft,
              radius: MediaQuery.of(context).size.width * 0.0035)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Image.asset(
                'assets/logo.png',
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              const Text(
                'SentimentAI is a tool which can detect sentiment in text using the techniques of Natural Language Processing.',
                textAlign: TextAlign.justify,
              ),
              Spacer(),
              Text('open-sourced on'),
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse(
                      'https://github.com/sreetejadusi/sentiment-ai'));
                },
                child: Image.asset(
                  'assets/github.png',
                  width: MediaQuery.of(context).size.width * 0.32,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              TextButton(
                  onPressed: () {
                    launchUrl(Uri.parse('https://sreeteja.dev'));
                  },
                  child: Text('sreeteja.dev'))
            ],
          ),
        ),
      ),
    );
  }
}
