import 'package:flutter/material.dart';
import 'package:question_answer_app/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      // home: MarqueeContainer(),
      home: const Scaffold(
        // backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: MarqueeContainer(),
          ),
        ),
      ),
    );
  }
}

class MarqueeContainer extends StatelessWidget {
  const MarqueeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/Backgroundimage.jpg"),
             fit: BoxFit.cover),
        
      ),
    
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const Text(
            'Welcome to QuizMaster!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 4,
                  color: Colors.black,
                  offset: Offset(1, 1),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: const QuizScreen(),
            ),
          ),
        ],
      ),
    );
  }
}