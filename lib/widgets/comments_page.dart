import 'package:flutter/material.dart';

class CommentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile_image.png'),
                    ),
                    title: Text('M3ayzo'),
                    subtitle: Text('This video is more entertaining than my WiFi speed! 🚀😂'),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile_image.png'),
                    ),
                    title: Text('Salma'),
                    subtitle: Text('I watched this video while coding, now I’m a coding wizard 🔮💻'),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile_image.png'),
                    ),
                    title: Text('1337HackerX'),
                    subtitle: Text('I hacked my way into the best video of 2025 🤖✨'),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile_image.png'),
                    ),
                    title: Text('Nisrine El Harkani'),
                    subtitle: Text('Just wrote a Python script that watches this video for me. #AutomationLife 💻😂'),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile_image.png'),
                    ),
                    title: Text('TechGuru'),
                    subtitle: Text('When you realize this video has more code than your latest project... 😅'),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile_image.png'),
                    ),
                    title: Text('FutureCoder1337'),
                    subtitle: Text('Learned more from this video than I did in my last hackathon! 🔥'),
                  ),
                ],
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Add a funny comment...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send, color: Colors.white),
                  onPressed: () {
                    // 
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
