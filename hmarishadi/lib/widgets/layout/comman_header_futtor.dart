import 'package:flutter/material.dart';

class CommonHeaderFooter extends StatelessWidget {
  final String title;
  final bool isDarkMode;
  final VoidCallback onThemeToggle;
  final Widget body;
  final int currentIndex;
  final Function(int) onTabChange;

  const CommonHeaderFooter({
    super.key,
    required this.title,
    required this.isDarkMode,
    required this.onThemeToggle,
    required this.body,
    required this.currentIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// 🔴 Common AppBar (NO login button)
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(1),
          child: Image.asset("assets/images/Hmarisadi-logo.png"),
        ),
        leadingWidth: 250.0,
        // title: Text(title),
        actions: [
          /// Help Icon
          IconButton(icon: const Icon(Icons.help_outline), onPressed: () {}),

          /// Dark / Light Toggle
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: onThemeToggle,
          ),
        ],
      ),

      /// 📄 Screen Body
      body: body,

      /// 🔻 Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabChange,
        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Matches",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: "Mailbox",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: "Chat",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        ],
      ),
    );
  }
}
