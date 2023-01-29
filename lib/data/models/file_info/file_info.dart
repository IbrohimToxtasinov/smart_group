import 'package:equatable/equatable.dart';

class FileInfo extends Equatable {
    FileInfo(
      {required this.fileName, required this.fileUrl, required this.progress});
  final String fileName;
  final String fileUrl;
  final double progress;

  FileInfo copyWith({
    String? fileName,
    String? fileUrl,
    double? progress,
  }) =>
      FileInfo(
        fileName: fileName ?? this.fileName,
        fileUrl: fileUrl ?? this.fileUrl,
        progress: progress ?? this.progress,
      );

  @override
  List<Object?> get props => [
        fileName,
        fileUrl,
        progress,
      ];

  List<FileInfo> fileData = [
    FileInfo(
        fileName: "Flutter",
        fileUrl: "https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf",
        progress: 0.0),
    FileInfo(
        fileName: "FlutterImg",
        fileUrl:
            "https://docs.flutter.dev/assets/images/flutter-logo-sharing.png",
        progress: 0.0),
    FileInfo(
        fileName: "Flutter",
        fileUrl: "https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf",
        progress: 0.0),
    FileInfo(
        fileName: "FlutterImg",
        fileUrl:
            "https://docs.flutter.dev/assets/images/flutter-logo-sharing.png",
        progress: 0.0),
    FileInfo(
        fileName: "Flutter",
        fileUrl: "https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf",
        progress: 0.0),
    FileInfo(
        fileName: "FlutterImg",
        fileUrl:
            "https://docs.flutter.dev/assets/images/flutter-logo-sharing.png",
        progress: 0.0),
  ];
}
