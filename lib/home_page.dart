import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/entities/entities.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:uuid/uuid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    FlutterCallkitIncoming.onEvent.listen((CallEvent? event) {
      if (event == null) return;
      switch (event.event) {
        case Event.actionCallIncoming:
          print('actionCallIncoming'); // received an incoming call
          break;
        case Event.actionCallStart:
          print('actionCallStart'); // started an outgoing call
          // show screen calling in Flutter
          break;
        case Event.actionCallAccept:
          print('actionCallAccept'); // show screen calling in Flutter
          break;
        case Event.actionCallDecline:
          print('actionCallDecline'); // declined an incoming call
          break;
        case Event.actionCallEnded:
          print('actionCallEnded'); // ended an incoming/outgoing call
          break;
        case Event.actionCallTimeout:
          // TODO: missed an incoming call
          break;
        case Event.actionCallCallback:
          print('actionCallCallback'); // only Android - click action `Call back` from missed call notification
          break;
        case Event.actionCallToggleHold:
          print('actionCallToggleHold'); //only iOS
          break;
        case Event.actionCallToggleMute:
          print('actionCallToggleMute'); //only iOS
          break;
        case Event.actionCallToggleDmtf:
          print('actionCallToggleDmtf'); //only iOS
          break;
        case Event.actionCallToggleGroup:
          print('actionCallToggleGroup'); //only iOS
          break;
        case Event.actionCallToggleAudioSession:
          print('actionCallToggleAudioSession'); //only iOS
          break;
        case Event.actionDidUpdateDevicePushTokenVoip:
          print('actionDidUpdateDevicePushTokenVoip'); // only iOS
          break;
        case Event.actionCallCustom:
          print('This is a custom object');
      }
      print('\n\n\n');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    var uuid = Uuid();
                    // await Future.delayed(const Duration(seconds: 3));
                    CallKitParams callKitParams = CallKitParams(
                      id: uuid.v4(),
                      nameCaller: 'Hien Nguyen',
                      appName: 'Callkit',
                      avatar: 'https://i.pravatar.cc/100',
                      handle: '0123456789',
                      type: 0,
                      textAccept: 'Accept',
                      textDecline: 'Decline',
                      missedCallNotification: NotificationParams(
                        showNotification: true,
                        isShowCallback: true,
                        subtitle: 'Missed call',
                        callbackText: 'Call back',
                      ),
                      duration: 30000,
                      extra: <String, dynamic>{'userId': '1a2b3c4d'},
                      headers: <String, dynamic>{'apiKey': 'Abc@123!', 'platform': 'flutter'},
                      android: AndroidParams(
                          isCustomNotification: true,
                          isShowLogo: false,
                          ringtonePath: 'system_ringtone_default',
                          backgroundColor: '#0955fa',
                          backgroundUrl: 'https://i.pravatar.cc/500',
                          actionColor: '#4CAF50',
                          textColor: '#ffffff',
                          incomingCallNotificationChannelName: "Incoming Call",
                          missedCallNotificationChannelName: "Missed Call",
                          isShowCallID: false),
                      ios: IOSParams(
                        iconName: 'CallKitLogo',
                        handleType: 'generic',
                        supportsVideo: true,
                        maximumCallGroups: 2,
                        maximumCallsPerCallGroup: 1,
                        audioSessionMode: 'default',
                        audioSessionActive: true,
                        audioSessionPreferredSampleRate: 44100.0,
                        audioSessionPreferredIOBufferDuration: 0.005,
                        supportsDTMF: true,
                        supportsHolding: true,
                        supportsGrouping: false,
                        supportsUngrouping: false,
                        ringtonePath: 'system_ringtone_default',
                      ),
                    );
                    try {
                      final res = await FlutterCallkitIncoming.showCallkitIncoming(callKitParams);

                      print(res.toString());
                      print("calling...");
                    } catch (e) {
                      print('Error: ');
                      print(e);
                    }
                  },
                  child: const Text('Press here to get a call')),
              ElevatedButton(
                  onPressed: () async {
                    await FlutterCallkitIncoming.endAllCalls();
                  },
                  child: const Text('End all calls'))
            ],
          ),
        ),
      ),
    );
  }
}
