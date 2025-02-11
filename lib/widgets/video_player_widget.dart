import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'comments_page.dart';
import 'share_page.dart';
import 'search_overlay.dart';
import 'profile_page.dart';

class VideoPlayerWidget extends StatefulWidget {
  final VideoPlayerController controller;
  final int videoIndex;

  const VideoPlayerWidget({required this.controller, required this.videoIndex});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  bool liked = false;
  int likes = 0;
  bool _showSearchOverlay = false;
  bool _isMuted = false;

  @override
  void initState() {
    super.initState();
    _loadLikeStatus();
    widget.controller.addListener(_videoListener);
  }

  void _videoListener() {
    if (widget.controller.value.position == widget.controller.value.duration) {
      widget.controller.seekTo(Duration.zero);
      widget.controller.play();
    }
  }

  void _loadLikeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      liked = prefs.getBool('liked_video_${widget.videoIndex}') ?? false;
      likes = prefs.getInt('likes_video_${widget.videoIndex}') ?? 0;
    });
  }

  void _saveLikeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('liked_video_${widget.videoIndex}', liked);
    prefs.setInt('likes_video_${widget.videoIndex}', likes);
  }

  void toggleLike() {
    setState(() {
      liked = !liked;
      likes += liked ? 1 : -1;
      _saveLikeStatus();
    });
  }

  void _toggleSearchOverlay() {
    setState(() {
      _showSearchOverlay = !_showSearchOverlay;
    });
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      widget.controller.setVolume(_isMuted ? 0.0 : 1.0);
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_videoListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          if (_showSearchOverlay) {
            setState(() {
              _showSearchOverlay = false;
            });
          }
        },
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
              },
              child: SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: widget.controller.value.size.width,
                    height: widget.controller.value.size.height,
                    child: VideoPlayer(widget.controller),
                  ),
                ),
              ),
            ),
            // Search Button
            Positioned(
              top: 20,
              left: 20,
              child: IconButton(
                icon: Icon(Icons.search, color: Colors.white, size: 30),
                onPressed: _toggleSearchOverlay,
              ),
            ),
            // Show Search Overlay
            if (_showSearchOverlay)
              SearchOverlay(
                onClose: () {
                  setState(() {
                    _showSearchOverlay = false;
                  });
                },
              ),
            // Like, Comment, Share Buttons
            Positioned(
              bottom: 100,
              right: 20,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      liked ? Icons.favorite : Icons.favorite_border,
                      color: liked ? Colors.red : Colors.white,
                      size: 30,
                    ),
                    onPressed: toggleLike,
                  ),
                  Text(
                    '$likes',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  IconButton(
                    icon: Icon(Icons.comment, color: Colors.white, size: 30),
                    onPressed: () => _showCommentsModal(context),
                  ),
                  SizedBox(height: 20),
                  IconButton(
                    icon: Icon(Icons.share, color: Colors.white, size: 30),
                    onPressed: () => _showShareModal(context),
                  ),
                ],
              ),
            ),
            // Profile info button
            Positioned(
              bottom: 20,
              left: 20,
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/images/profile_image.png'),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '1337FutureIsLoading',
                          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: const [
                        Icon(Icons.music_note, color: Colors.white, size: 20),
                        SizedBox(width: 5),
                        Text(
                          'Original Sound',
                          style: TextStyle(color: Colors.white, fontSize: 14, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Mute Button
            Positioned(
              bottom: 20,
              right: 20,
              child: IconButton(
                icon: Icon(
                  _isMuted ? Icons.volume_off : Icons.volume_up,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: _toggleMute,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCommentsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: CommentsPage(),
        );
      },
    );
  }

  void _showShareModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.4,
          minChildSize: 0.2,
          maxChildSize: 0.6,
          builder: (context, scrollController) {
            return SharePage();
          },
        );
      },
    );
  }
}
