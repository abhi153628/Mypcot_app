import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mypcot_assesment/view/home_page/home_page.dart';

class ScreenSplash1 extends StatefulWidget {
  const ScreenSplash1({super.key});

  @override
  State<ScreenSplash1> createState() => _ScreenSplash1State();
}

class _ScreenSplash1State extends State<ScreenSplash1> {
  @override
  void initState() {
    super.initState();

    // Navigate to dashboard after animations complete
    Future.delayed(const Duration(milliseconds: 2800), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 800),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container for logo and text with subtle animations
            Container(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo animation with scale and bounce effect
                  FadeInDown(
                    duration: const Duration(milliseconds: 1000),
                    child: BounceInDown(
                      from: 20,
                      duration: const Duration(milliseconds: 1200),
                      child: Image.asset(
                        'asset/mypcot.png',
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ),
                  
                  // Text with staggered letter animation
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: FadeIn(
                      delay: const Duration(milliseconds: 600),
                      duration: const Duration(milliseconds: 800),
                      child: ElasticIn(
                        delay: const Duration(milliseconds: 600),
                        duration: const Duration(milliseconds: 1200),
                        child: const Text(
                          "Mypcot",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Subtle highlight animation below logo
            FadeInUp(
              delay: const Duration(milliseconds: 1200),
              duration: const Duration(milliseconds: 800),
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                width: 140,
                height: 3,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.transparent, Colors.blue, Colors.transparent],
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            
            // Tagline with fade-in animation
            FadeIn(
              delay: const Duration(milliseconds: 1500),
              duration: const Duration(milliseconds: 800),
              child: const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  "Innovation Delivered",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}