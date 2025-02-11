import 'dart:math';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../widgets/video_player_widget.dart';

class VideoScrollScreen extends StatefulWidget {
  @override
  _VideoScrollScreenState createState() => _VideoScrollScreenState();
}

class _VideoScrollScreenState extends State<VideoScrollScreen> {
  final PageController _pageController = PageController(viewportFraction: 1);
  final List<String> originalVideos = [
    'assets/videos/1337reel1.mp4',
    'assets/videos/1337reel3.mp4',
    'assets/videos/1337reel2.mp4',
  ];
  late List<String> videoUrls;
  late List<VideoPlayerController?> _controllers;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    videoUrls = List.from(originalVideos)..shuffle(Random()); 
    _controllers = List.filled(videoUrls.length, null);
    _initializeController(_currentIndex);
    _pageController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller?.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    int newIndex = _pageController.page?.round() ?? _currentIndex;
    if (newIndex != _currentIndex) {
      _updateCurrentIndex(newIndex % videoUrls.length); 
    }
  }

  void _initializeController(int index) {
    if (_controllers[index] == null && index >= 0 && index < videoUrls.length) {
      _controllers[index] = VideoPlayerController.asset(videoUrls[index])
        ..initialize().then((_) {
          if (mounted) {
            setState(() {});
            _controllers[index]?.play();
          }
        });
    }
  }

  void _disposeController(int index) {
    _controllers[index]?.dispose();
    _controllers[index] = null;
  }

  void _updateCurrentIndex(int newIndex) {
    if (newIndex != _currentIndex) {
      _controllers[_currentIndex]?.pause();
      _initializeController(newIndex);
      _controllers[newIndex]?.play();
      setState(() {
        _currentIndex = newIndex;
      });

      if (_currentIndex > 1) {
        _disposeController(_currentIndex - 2);
      }
      if (_currentIndex < videoUrls.length - 2) {
        _initializeController(_currentIndex + 2);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: videoUrls.length * 1000, 
        onPageChanged: (index) {
          _updateCurrentIndex(index % videoUrls.length); 
        },
        itemBuilder: (context, index) {
          int actualIndex = index % videoUrls.length;
          if (_controllers[actualIndex] == null || !_controllers[actualIndex]!.value.isInitialized) {
            return Center(child: CircularProgressIndicator());
          }
          return VideoPlayerWidget(
            controller: _controllers[actualIndex]!,
            videoIndex: actualIndex,
          );
        },
      ),
    );
  }
}
