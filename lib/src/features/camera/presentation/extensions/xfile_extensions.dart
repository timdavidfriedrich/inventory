import 'dart:io';

import 'package:camera/camera.dart';
import 'package:image/image.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

const _quality = 90;

extension XFileExtensions on XFile {
  Future<XFile> cropToSquare() async {
    try {
      final bytes = await readAsBytes();
      final image = decodeImage(bytes);
      if (image == null) {
        throw Exception("Could not decode image for cropping.");
      }
      final size = image.width < image.height ? image.width : image.height;
      final square = copyResizeCropSquare(image, size: size);
      final jpgBytes = encodeJpg(square, quality: _quality);
      final directory = await getTemporaryDirectory();
      final name = basenameWithoutExtension(path);
      final outPath = join(directory.path, "${name}_square.jpg");

      try {
        await File(path).delete();
      } catch (_) {}

      await File(outPath).writeAsBytes(jpgBytes);
      return XFile(outPath);
    } catch (e) {
      rethrow;
    }
  }
}
