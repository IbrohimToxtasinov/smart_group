import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smart_group/data/models/file_info/file_info.dart';
import 'package:smart_group/state_managers/cubit/download_cubit/file_download_state.dart';


class FileDownloadCubit extends Cubit<FileDownloadState> {
  FileDownloadCubit()
      : super(FileDownloadState(progress: 0.0, newFileLocation: ""));

  void downloadFileIfExists({required FileInfo fileInfo}) async {
    bool hasPermission = await _requestWritePermission();
    if (!hasPermission) {
      Dio dio = Dio();
      var directory = await getDownloadPath();
      if (directory == null) {
        return;
      }
      String url = fileInfo.fileUrl;
      String newFilelocation =
          "${directory.path}/${fileInfo.fileName}${DateTime.now().microsecond}${url.substring(url.length - 5, url.length)}";
      try {
        await dio.download(url, newFilelocation,
            onReceiveProgress: (count, total) {
          var progress = count / total;
          emit(state.copyWith(progress: progress));
        });
        emit(state.copyWith(newFileLocation: newFilelocation));
      } catch (error) {
        debugPrint(error.toString());
      }
    }
  }

  void downloadFile({required String fileName, required String url}) async {
    bool haspermission = await _requestWritePermission();
    if (!haspermission) return;
    Dio dio = Dio();
    var directory = await getDownloadPath();
    String newFilelocation =
        "${directory?.path}/$fileName${url.substring(url.length - 5, url.length)}";
    var allFiles = directory?.list();
    List<String> filepath = [];
    await allFiles?.forEach((element) {
      filepath.add(element.path.toString());
    });

    if (filepath.contains(newFilelocation)) {
      OpenFile.open(newFilelocation);
    } else {
      try {
        await dio.download(
          url,
          newFilelocation,
          onReceiveProgress: (count, total) {
            double progress = count / total;
            emit(state.copyWith(progress: progress));
          },
        );
        OpenFile.open(newFilelocation);
      } catch (error) {
        debugPrint(error.toString());
      }
    }
  }

  Future<Directory?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (error) {
      debugPrint(error.toString());
    }
    return directory;
  }

  Future<bool> _requestWritePermission() async {
    await Permission.storage.request();
    return await Permission.storage.request().isGranted;
  }
}
