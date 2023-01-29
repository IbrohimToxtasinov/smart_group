import 'package:flutter/material.dart';
import 'package:smart_group/view/widgets/single_file_download.dart';

class FileDownloadPage extends StatelessWidget {
  const FileDownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("File Download Page"),
        centerTitle: true,
      ),
      body: ListView(
        children: List.generate(fileData.lenght, (index) {
          var singleFile = fileData[index];
          return SingleFileDownload(fileInfo: singleFile);
        }),
      ),
    );
  }
}
