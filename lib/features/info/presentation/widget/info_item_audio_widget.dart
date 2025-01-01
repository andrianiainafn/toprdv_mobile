import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:my_template_project/features/info/presentation/widget/audio_error_widget.dart';
import 'package:my_template_project/features/info/presentation/widget/audio_loading_widget.dart';

import '../../../../core/util/format_date.dart';

class InfoItemAudioWidget extends StatefulWidget {
  final String audioUrl;
  final String brand;
  final DateTime date;
  const InfoItemAudioWidget({
    super.key,
    required this.audioUrl, required this.brand, required this.date,
  });

  @override
  State<InfoItemAudioWidget> createState() => _InfoItemAudioWidgetState();
}

class _InfoItemAudioWidgetState extends State<InfoItemAudioWidget> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  bool _isInitialized = false;
  bool _hasError = false;
  String _errorMessage = '';
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isFirstPlay = true;

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
  }

  Future<void> _initAudioPlayer() async {
    try {
      _audioPlayer = AudioPlayer();
      await _setupAudioPlayer();
      setState(() {
        _isInitialized = true;
        _hasError = false;
      });
    } catch (e) {
      setState(() {
        _hasError = true;
        _errorMessage = e.toString();
      });
      debugPrint('Error initializing audio player: $e');
    }
  }

  Future<void> _setupAudioPlayer() async {
    // Listen to audio duration changes
    _audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() => _duration = d);
    });

    // Listen to audio position changes
    _audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() => _position = p);
    });

    // Listen to player complete
    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() {
        _isPlaying = false;
        _position = Duration.zero;
        _isFirstPlay = true;
      });
    });

    // Listen to player state changes
    _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        _isPlaying = state == PlayerState.playing;
      });
    });

    // Set the audio source
    try {
      await _audioPlayer.setSource(UrlSource(widget.audioUrl));
    } catch (e) {
      setState(() {
        _hasError = true;
        _errorMessage = 'Error loading audio: ${e.toString()}';
      });
      debugPrint('Error setting audio source: $e');
    }
  }

  Future<void> _playPause() async {
    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
      } else {
        if (_isFirstPlay) {
          await _audioPlayer.play(UrlSource(widget.audioUrl));
          _isFirstPlay = false;
        } else {
          await _audioPlayer.resume();
        }
      }
    } catch (e) {
      setState(() {
        _hasError = true;
        _errorMessage = 'Playback error: ${e.toString()}';
      });
      debugPrint('Error playing/pausing audio: $e');
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return AudioErrorWidget(errorMessage: _errorMessage);
    }
    if (!_isInitialized) {
      return AudioLoadingWidget();
    }

    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white.withAlpha(77),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 10,
              offset: Offset(0, 4),
            )
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.brand, style: TextStyle(fontSize: 18,color: Colors.green),),
          Text( formatDate(widget.date) ),
          // Progress bar
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.green,
              inactiveTrackColor: Colors.grey[300],
              trackHeight: 4.0,
              thumbColor: Colors.green,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
              overlayColor: Colors.green.withAlpha(32),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 14.0),
            ),
            child: Slider(
              min: 0,
              max: _duration.inMilliseconds.toDouble(),
              value: _position.inMilliseconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(milliseconds: value.round());
                await _audioPlayer.seek(position);
              },
            ),
          ),

          // Duration indicators
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_formatDuration(_position)),
                Text(_formatDuration(_duration)),
              ],
            ),
          ),
          // Playback controls
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 32,
                icon: Icon(
                  Icons.replay_10,
                  color: Colors.green,
                ),
                onPressed: () async {
                  await _audioPlayer.seek(_position - const Duration(seconds: 10));
                },
              ),
              IconButton(
                iconSize: 64,
                icon: Icon(
                  _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                  color: Colors.green,
                ),
                onPressed: _playPause,
              ),
              IconButton(
                iconSize: 32,
                icon: Icon(
                  Icons.forward_10,
                  color: Colors.green,
                ),
                onPressed: () async {
                  await _audioPlayer.seek(_position + const Duration(seconds: 10));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}