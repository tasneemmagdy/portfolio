import 'dart:html' as html;

class LauncherHelper {
  static void open(String url) {
    if (!url.startsWith('http') && !url.startsWith('mailto') && !url.startsWith('tel')) {
      final origin = html.window.location.origin;
      url = '$origin/$url';
    }
    html.window.open(url, "_blank");
  }
}