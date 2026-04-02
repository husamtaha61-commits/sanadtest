import 'dart:io';

extension FileExtensions on File {
  bool get isImage {
    final fileExtension = path.split('.').last.toLowerCase();
    const imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'];
    return imageExtensions.contains(fileExtension);
  }
}