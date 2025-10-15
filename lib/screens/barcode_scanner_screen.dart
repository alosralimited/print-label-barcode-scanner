import 'package:flutter/material.dart';
import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';

class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({super.key});

  @override
  State<BarcodeScannerScreen> createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Barcode')),
      body: AiBarcodeScanner(
        onDetect: (BarcodeCapture capture) {
          final String? scannedValue = capture.barcodes.first.rawValue;
          if (scannedValue != null && scannedValue.isNotEmpty) {
            Navigator.of(context).pop(scannedValue);
          }
        },
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.noDuplicates,
        ),
      ),
    );
  }
}
