import 'package:flutter/material.dart';

class SearchOverlay extends StatelessWidget {
  final VoidCallback onClose;

  const SearchOverlay({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 20,
      right: 20,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.search, color: Colors.white),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('1337 amazing school 🏫', style: TextStyle(color: Colors.white)),
              subtitle: Text('Enroll now and unlock your secret hacker skills 🤖', style: TextStyle(color: Colors.white70)),
              onTap: () {
                // 
              },
            ),
            ListTile(
              title: Text('1337 future is loading 🔄', style: TextStyle(color: Colors.white)),
              subtitle: Text('Your future as a coding legend is just a click away 👾', style: TextStyle(color: Colors.white70)),
              onTap: () {
                // 
              },
            ),
            ListTile(
              title: Text('Nisrine El Harkani - The Code Whisperer 💻✨', style: TextStyle(color: Colors.white)),
              subtitle: Text('Master of Python, C++, and creating epic apps 📱', style: TextStyle(color: Colors.white70)),
              onTap: () {
                // 
              },
            ),
            ListTile(
              title: Text('Nisrine’s secret recipe: 1 part code, 2 parts caffeine ☕💻', style: TextStyle(color: Colors.white)),
              onTap: () {
                // 
              },
            ),
          ],
        ),
      ),
    );
  }
}
