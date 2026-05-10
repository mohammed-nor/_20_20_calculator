# 🚀 QUICK BUILD & PUBLISH COMMANDS

## 1. PREPARE FOR BUILD
```bash
flutter clean
flutter pub get
```

## 2. BUILD RELEASE APP BUNDLE (for Play Store)
```bash
flutter build appbundle --release
```
✅ Output: `build/app/outputs/bundle/release/app-release.aab`

## 3. BUILD RELEASE APK (alternative, if needed)
```bash
flutter build apk --release
```
✅ Output: `build/app/outputs/apk/release/app-release.apk`

## 4. VERIFY SIGNING
The build will fail if keystore passwords are incorrect.
Make sure to update them in `android/app/build.gradle.kts` first!

## 5. UPLOAD TO PLAY STORE
1. Go to Google Play Console
2. Select your app
3. Go to "Release" > "Production"
4. Click "Create new release"
5. Upload the AAB file (app-release.aab)
6. Add release notes
7. Review all details
8. Click "Review release"
9. Click "Rollout to production"

## ADDITIONAL NOTES

- App Icon: Add 512x512 PNG to `android/app/src/main/res/mipmap/`
- App Name: Currently "20/20" (can be changed in AndroidManifest.xml)
- Package ID: com.norit.twentytwenty (unique identifier - cannot change after first release)
- Version: Update in pubspec.yaml as needed

## TROUBLESHOOTING

**Build fails with "keystore not found":**
- Ensure you're in the project root directory when building
- Paths in build.gradle.kts are relative to `android/app/`

**Build fails with "wrong password":**
- Re-enter correct passwords in `android/app/build.gradle.kts`
- Make sure there are no spaces or typos

**Need to update app later:**
- Increase versionCode and versionName in pubspec.yaml
- Run build commands again
- Submit new AAB to Play Store

## KEEPING YOUR KEYSTORE SAFE

⚠️ **CRITICAL SECURITY REMINDER:**
- Never commit twentytwenty-keystore.jks to public repositories
- Keep passwords in a secure password manager
- Backup the keystore to a secure location
- You cannot change the keystore after publishing to Play Store
- If lost, you'll need to create a new app listing with a different package name
