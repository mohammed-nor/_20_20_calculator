# Flutter-specific ProGuard rules
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.embedding.** { *; }

# Keep Flutter Material and Cupertino components
-keep class androidx.** { *; }
-keep interface androidx.** { *; }

# Preserve line numbers for debugging
-keepattributes SourceFile,LineNumberTable
-renamesourcefileattribute SourceFile

# Keep custom application classes
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider

# Preserve enum values
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# Google Play Core - optional dependencies for dynamic features
# These are used by Flutter for deferred components, but not required for simple apps
-dontwarn com.google.android.play.core.**
-keep class com.google.android.play.core.** { *; }

# Suppress warnings for missing Google Play Core references
-keepclasseswithmembers class * {
  *** *(...);
}

# Keep all Flutter embedding classes that might reference Play Core
-keep class io.flutter.embedding.android.FlutterPlayStoreSplitApplication { *; }
-keep class io.flutter.embedding.engine.deferredcomponents.PlayStoreDeferredComponentManager { *; }

