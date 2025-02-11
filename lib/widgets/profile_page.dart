import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile header
            Container(
              color: Colors.black,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profile_image.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '1337FutureIsLoading',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'The Code Whisperer 🧑‍💻✨',
                    style: TextStyle(fontSize: 18, color: Colors.purpleAccent),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Bio: Turning coffee into code, one app at a time. ☕💻',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  // Follow Button
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isFollowing = !isFollowing;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purpleAccent,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isFollowing ? Icons.favorite : Icons.favorite_border,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text(isFollowing ? 'Following' : 'Follow Me'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // School Information
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.black.withOpacity(0.8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1337 Amazing School 🏫',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Enroll now to unlock secret hacker skills 🤖',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Future goals: Become a coding legend with epic apps 🎮🏆',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ],
              ),
            ),

            // Recent Achievement
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Recent Achievement: \nDeveloped a ping pong game with Django and React 🎮🏆',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ),

            // Reels and Posts Section
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.black.withOpacity(0.9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reels',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  // List of Reels (Post/Video items)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5, 
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        leading: Icon(Icons.video_collection, color: Colors.white, size: 30),
                        title: Text('Video Reel #${index + 1}', style: TextStyle(color: Colors.white)),
                        subtitle: Text('Reel description goes here...', style: TextStyle(color: Colors.white70)),
                        onTap: () {
                          // Navigate to video details
                        },
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Posts',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  // List of Posts
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5, // You can change this number based on the number of posts
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        leading: Icon(Icons.post_add, color: Colors.white, size: 30),
                        title: Text('Post #${index + 1}', style: TextStyle(color: Colors.white)),
                        subtitle: Text('Post content here...', style: TextStyle(color: Colors.white70)),
                        onTap: () {
                          // Navigate to post details
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
