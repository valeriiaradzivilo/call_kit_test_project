# CallKit Test Project

This Flutter application demonstrates the integration of the [`flutter_callkit_incoming`](https://pub.dev/packages/flutter_callkit_incoming) plugin to handle incoming and outgoing calls using CallKit on iOS and a similar functionality on Android. The app showcases how to configure and display incoming call notifications, handle various call events, and manage call states.

## Features

- **Incoming Call Notification**: Displays an incoming call notification with customizable parameters such as caller name, avatar, and call handle.
- **Outgoing Call Handling**: Initiates an outgoing call and displays the call screen.
- **Call Events Handling**: Listens to and handles various call events such as call start, accept, decline, end, and more.
- **Customizable UI**: Allows customization of the call notification UI for both Android and iOS.
- **Missed Call Notification**: Displays a missed call notification with a callback option.

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio or Xcode for platform-specific configurations

### Installation

1. **Clone the repository**:
   ```sh
   git clone https://github.com/yourusername/callkit_test_project.git
   cd callkit_test_project
   ```

2. **Install dependencies**:
   ```sh
   flutter pub get
   ```

3. **Configure platform-specific settings**:
   - **Android**: Add necessary permissions in `AndroidManifest.xml`.
   - **iOS**: Add necessary permissions in `Info.plist`.

### Running the App

1. **Run on Android**:
   ```sh
   flutter run
   ```

2. **Run on iOS**:
   ```sh
   flutter run
   ```

## Usage

- **Simulate an Incoming Call**: Press the "Press here to get a call" button to simulate an incoming call notification.
- **End All Calls**: Press the "End all calls" button to end all ongoing calls.

## Code Overview

- **HomePage**: The main screen of the app containing buttons to simulate incoming calls and end all calls.
- **CallKitParams**: Configuration parameters for the incoming call notification.
- **Event Handling**: Listens to various call events and handles them accordingly.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgements

- [flutter_callkit_incoming](https://pub.dev/packages/flutter_callkit_incoming) plugin for providing the CallKit functionality.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

---

Feel free to customize this description to better fit your project's specifics and requirements.
