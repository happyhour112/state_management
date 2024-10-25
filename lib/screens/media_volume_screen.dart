import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/providers/media_volume_provider.dart';

class MediaVolumeScreen extends ConsumerStatefulWidget {
  const MediaVolumeScreen({
    super.key,
    //required this.mediaVolume,
    //required this.onMediaVolumeUpdate,
  });

  //final int mediaVolume;
  //final void Function(int volume) onMediaVolumeUpdate;

  @override
  ConsumerState<MediaVolumeScreen> createState() => _MediaVolumeScreenState();
}

class _MediaVolumeScreenState extends ConsumerState<MediaVolumeScreen> {
  // late int _currentVolume;

  // @override
  // void initState() {
  //   _currentVolume = widget.mediaVolume;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    int currentVolume = ref.watch(mediaVolumeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Volume'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: ElevatedButton(
          onPressed: () {
            //Navigator.pop(context, _currentVolume);
            Navigator.pop(context);
          },
          child: const Text('BACK'),
        ),
      ),
      body: Center(
        child: Slider(
          value: currentVolume.toDouble(),
          min: 0,
          max: 100,
          divisions: 100,
          label: currentVolume.toString(),
          onChanged: (val) {
            setState(() {
              currentVolume = val.toInt();
              //widget.onMediaVolumeUpdate(_currentVolume);
            });
            ref
                .read(mediaVolumeProvider.notifier)
                .setMediaVolume(currentVolume);
          },
        ),
      ),
    );
  }
}
