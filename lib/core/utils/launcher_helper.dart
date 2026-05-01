import 'dart:html' as html;

class LauncherHelper {
  static void open(String url) {
    // لو relative path حوّليه لـ absolute
    if (!url.startsWith('http') && !url.startsWith('mailto') && !url.startsWith('tel')) {
      final base = html.window.location.href.split('#')[0];
      final origin = html.window.location.origin;
      url = '$origin/$url';
    }
    html.window.open(url, "_blank");
  }
}