import 'dart:html' as html;

class LauncherHelper {
  static void open(String url) {
    html.window.open(url, "_blank");
  }
}