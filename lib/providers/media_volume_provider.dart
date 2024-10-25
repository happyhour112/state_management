import 'package:flutter_riverpod/flutter_riverpod.dart';

class MediaVolumeNotifier extends StateNotifier<int> {
  MediaVolumeNotifier() : super(50);

  void setMediaVolume(int volume) {
    state = volume;
  }
}

final mediaVolumeProvider =
    StateNotifierProvider<MediaVolumeNotifier, int>((ref) {
  return MediaVolumeNotifier();
});
