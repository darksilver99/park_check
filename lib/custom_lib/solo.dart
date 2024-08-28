
import '../auth/firebase_auth/auth_util.dart';

String firebasePathPrefix() => 'users/$currentUserUid/uploads';

String? removeTrailingSlash(String? path) => path != null && path.endsWith('/') ? path.substring(0, path.length - 1) : path;

String getStoragePath(
    String? pathPrefix,
    String filePath,
    bool isVideo, [
      int? index,
    ]) {
  pathPrefix ??= firebasePathPrefix();
  pathPrefix = removeTrailingSlash(pathPrefix);
  final timestamp = DateTime.now().microsecondsSinceEpoch;
  final ext = isVideo ? 'mp4' : filePath.split('.').last;
  final indexStr = index != null ? '_$index' : '';
  return '$pathPrefix/$timestamp$indexStr.$ext';
}