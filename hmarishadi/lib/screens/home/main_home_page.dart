import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hmarishadi/widgets/layout/comman_header_futtor.dart';

class MainHomePage extends StatefulWidget {
  final String title;
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const MainHomePage({
    super.key,
    required this.title,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _index = 0;
  int _currentBanner = 0;

  final List<String> bannerImages = [
    'assets/banners/banner1.webp',
    'assets/banners/banner3.jpg',
    'assets/banners/banner4.jpg',
    'assets/banners/banner5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return CommonHeaderFooter(
      title: widget.title,
      isDarkMode: widget.isDarkMode,
      onThemeToggle: widget.onThemeToggle,
      currentIndex: _index,
      onTabChange: (i) => setState(() => _index = i),

      body: SingleChildScrollView(
        child: Column(
          children: [
            /// ================= CARD STYLE CAROUSEL =================
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: [
                  /// 🔥 Carousel
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 210,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.89,
                      autoPlayInterval: const Duration(seconds: 3),

                      /// 👇 page change detect
                      onPageChanged: (index, reason) {
                        setState(() => _currentBanner = index);
                      },
                    ),
                    items: bannerImages.map((imgPath) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(51),
                              blurRadius: 10,
                              offset: const Offset(2, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            imgPath,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 12),

                  /// ================= DOTS INDICATOR =================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: bannerImages.asMap().entries.map((entry) {
                      bool isActive = _currentBanner == entry.key;

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: isActive ? 18 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: isActive
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),

            /// Welcome text
            Text(
              "Welcome to Hmarishadi",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
