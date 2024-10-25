import 'package:flutter/material.dart';
import 'package:state_management/screens/media_volume_screen.dart';
import 'package:state_management/screens/ringtone_volume_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/providers/media_volume_provider.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({
    super.key,
    //required this.mediaVolume,
    // required this.onMediaVolumeUpdate,
  });

  //final int mediaVolume;
  // final void Function(int volume) onMediaVolumeUpdate;

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  int _ringtoneVolume = 50;
  //late int _mediaVolume;

  Future<void> _navigateAndGetVolume(BuildContext context) async {
    final int volume = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RingtoneVolumeScreen(_ringtoneVolume),
      ),
    );

    if (!context.mounted) return;

    setState(() {
      _ringtoneVolume = volume;
    });
  }

  // Future<void> _awaitAndNavigateMedia(BuildContext context) async {
  //   final int newVolume = await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => MediaVolumeScreen(
  //         mediaVolume: widget.mediaVolume,
  //         //onMediaVolumeUpdate: widget.onMediaVolumeUpdate,
  //       ),
  //     ),
  //   );

  //   if (!context.mounted) return;

  //   if (newVolume != widget.mediaVolume) {
  //     setState(() {
  //       _mediaVolume = newVolume;
  //     });
  //   }
  // }

  // @override
  // void initState() {
  //   _mediaVolume = widget.mediaVolume;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final mediaVolume = ref.watch(mediaVolumeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('BACK'),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Card.filled(
            margin: const EdgeInsets.only(left: 16, right: 16),
            elevation: 2.0,
            child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  _navigateAndGetVolume(context);
                },
                child: ListTile(
                  trailing: Text(
                    '$_ringtoneVolume',
                    style: const TextStyle(fontSize: 16),
                  ),
                  title: const Text('Ringtone Volume'),
                )),
          ),
          const SizedBox(height: 8),
          Card.filled(
            margin: const EdgeInsets.only(left: 16, right: 16),
            elevation: 2.0,
            child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  //_awaitAndNavigateMedia(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MediaVolumeScreen(
                          //mediaVolume: mediaVolume,
                          ),
                    ),
                  );
                },
                child: ListTile(
                  trailing: Text(
                    '$mediaVolume',
                    style: const TextStyle(fontSize: 16),
                  ),
                  title: const Text('Media Volume'),
                )),
          ),
        ],
      ),
    );
  }
}
