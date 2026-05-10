📱 FLUTTER APP - PLAY STORE PUBLISHING GUIDE
=============================================

✅ COMPLETED SETUP:
- Signing keystore created: twentytwenty-keystore.jks
- build.gradle.kts configured with signing config
- ProGuard rules configured for code obfuscation
- AndroidManifest.xml properly configured

⚠️ IMPORTANT - NEXT STEPS:

1. CONFIGURE KEYSTORE PASSWORDS
   File: android/app/build.gradle.kts
   
   Replace in signingConfigs block:
   - keyPassword = "YOUR_KEY_PASSWORD_HERE"
   - storePassword = "YOUR_KEYSTORE_PASSWORD_HERE"
   
   Use the passwords you set when creating the keystore file.

2. BUILD RELEASE APK/AAB
   
   For App Bundle (Recommended for Play Store):
   flutter build appbundle --release
   
   Output: build/app/outputs/bundle/release/app-release.aab

3. PLAY STORE CHECKLIST
   
   ☐ Update app description in pubspec.yaml
   ☐ Add app screenshots (5-8 minimum)
   ☐ Write compelling app description (80-4000 characters)
   ☐ Choose appropriate content rating
   ☐ Set pricing and distribution countries
   ☐ Complete app privacy policy
   ☐ Add app icon (512x512 PNG)
   ☐ Create a Google Play Developer account ($25 one-time fee)
   ☐ Create app on Google Play Console
   ☐ Upload signed AAB/APK
   ☐ Set release notes
   ☐ Review all store listing details
   ☐ Submit for review

4. VERSION MANAGEMENT
   
   Current Version: 1.0.0
   Build Number: 1
   
   To update: Edit pubspec.yaml
   version: X.Y.Z+buildNumber
   Example: version: 1.0.1+2

5. APP DETAILS
   
   Package Name: com.norit.twentytwenty
   App Name: 20/20
   Min SDK: 21
   Target SDK: Latest (via Flutter)

6. SECURE YOUR KEYSTORE
   
   ⚠️ CRITICAL: Keep twentytwenty-keystore.jks safe!
   - Store in a secure location (do not commit to public repos)
   - Add to .gitignore
   - Backup to secure cloud storage
   - Never share the passwords
   - Use the SAME keystore for all future app updates
   
   If you lose this keystore, you cannot update the app on Play Store!

7. SIGNING VERIFICATION
   
   To verify the release build:
   flutter build appbundle --release
   
   The build will use the signing config if passwords are correct.

TROUBLESHOOTING:
- If "keystore file not found": Ensure path is relative from android/app/
- If "wrong password": Double-check your keystore passwords
- If build fails: Run flutter clean && flutter pub get first

Have any questions? Check flutter.dev/docs/deployment/android for more info.
