# emcus_ble

EMCUS BLE

Project Documentation: emcus ble

Project Overview:
emcus ble is a mobile application developed using Flutter framework and Firebase services. It provides user authentication functionality along with navigation features. Users can register, log in, navigate through different screens, and log out seamlessly within the app.

Project Setup:
1. Install Flutter:
   - Ensure Flutter SDK is installed on your system. Follow the official Flutter installation guide 
2. Create a Repository:
   - Create a emcus ble repository on GitHub and host it.
3. Developing the UI:
     - From the give UI/UX Design develop the UI using flutter
4. Firebase Setup:
   - Go to the Firebase Console: Firebase Console
   - Create a new project.
   - Set up Firebase Authentication:
     - Enable Email/Password sign-in method.
   - Obtain the `google-services.json` file for and add it to the respective directories..
   - Ensure Firebase SDK dependencies are added to your Flutter project's `pubspec.yaml` file.

5. Project Configuration:
   - Configure Firebase in your Flutter project by following the official FlutterFire setup guide: FlutterFire Setup

Usage Instructions:
1. Registration:
   - Launch the app and navigate to the registration screen.
   - Enter details like Name, company name, email, password and confirm password.
   - Accept the terms and conditions
   - Click on the “Register” button to create a new account.
   
2. Login:
   - After registration or if you already have an account, navigate to the sign in screen.
   - Enter your registered email and password.
   - Click on the login button to authenticate.
   
3. Navigation:
   - Upon successful login, you will be directed to the home screen.
   - The home screen contains a bottom navigation bar with options for different screens.
   - Navigate to desired screens by tapping on the respective icons on the bottom navigation  bar.
   
4. Logout:
   - To log out, navigate any screen after login.
   - On top Right side of the screen there is a logout Icon Click the icon and it will ask for your confirmation.
   - You will be logged out and redirected to the login screen.

Additional Notes:
- Ensure a stable internet connection for Firebase authentication to work seamlessly.



