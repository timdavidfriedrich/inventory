import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:inventory/src/core/presentation/app_router.dart';
import 'package:inventory/src/core/domain/entities/scan_result.dart';
import 'package:log/log.dart';

class CaptureFlowCoordinator {
  static Future<void> startCaptureFlow(BuildContext context) async {
    try {
      // Take a picture
      final imageData = await CameraRoute().push<Uint8List>(context);
      if (imageData == null || !context.mounted) {
        Log.warning("No image data received or context is not mounted");
        return;
      }

      // Get scan results
      final scanResult = await ScanRoute(imageData).push<ScanResult>(context);
      final ScanResultWithImage scanResultWithImage;
      if (scanResult != null) {
        scanResultWithImage = scanResult.attachImage(imageData);
      } else {
        Log.warning("No scan result received or context is not mounted");
        scanResultWithImage = ScanResultWithImage(imageData: imageData);
      }

      // Navigate to details with image and scan result
      if (context.mounted) {
        DetailsFromScanRoute(scanResultWithImage).push(context);
      }
    } on CameraException catch (e) {
      Log.error("Camera error: ${e.description}");
      _showErrorSnackBar(context, 'Camera error occurred');
    } on PlatformException catch (e) {
      Log.error("Platform error: ${e.message}");
      _showErrorSnackBar(context, 'Device error occurred');
    } on GoException catch (e) {
      Log.error("Navigation error: ${e.message}");
      _showErrorSnackBar(context, 'Navigation error occurred');
    } on TimeoutException catch (e) {
      Log.error("Timeout error: ${e.message}");
      _showErrorSnackBar(context, 'Operation timed out');
    } on FormatException catch (e) {
      Log.error("Format error: ${e.message}");
      _showErrorSnackBar(context, 'Image format error');
    }
  }

  static void _showErrorSnackBar(BuildContext context, String message) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
