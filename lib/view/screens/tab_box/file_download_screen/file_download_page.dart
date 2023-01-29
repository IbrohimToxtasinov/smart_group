import 'package:flutter/material.dart';
import 'package:smart_group/data/models/file_info/file_info.dart';
import 'package:smart_group/view/widgets/single_file_download.dart';

class FileDownloadScreen extends StatefulWidget {
  const FileDownloadScreen({super.key});

  @override
  State<FileDownloadScreen> createState() => _FileDownloadScreenState();
}

class _FileDownloadScreenState extends State<FileDownloadScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("File Download Page"),
        centerTitle: true,
      ),
      body: ListView(
        children: List.generate(fileData.length, (index) {
          var singleFile = fileData[index];
          return SingleFileDownload(fileInfo: singleFile);
        }),
      ),
    );
  }
}
