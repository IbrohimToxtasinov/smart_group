import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_group/data/models/file_info/file_info.dart';
import 'package:smart_group/state_managers/cubit/download_cubit/file_download-cubit.dart';
import 'package:smart_group/state_managers/cubit/download_cubit/file_download_state.dart';

class SingleFileDownload extends StatelessWidget {
  SingleFileDownload({super.key, required this.fileInfo});
  final FileInfo fileInfo;
  FileDownloadCubit fileDownloadCubit = FileDownloadCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: fileDownloadCubit,
      child: BlocBuilder<FileDownloadCubit, FileDownloadState>(
        builder: (context, state) {
          return ListTile(
            leading: state.newFileLocation.isEmpty
                ? const Icon(Icons.download)
                : const Icon(Icons.download_done),
            title: Text("Downloaded:${state.progress * 100}%"),
            subtitle: LinearProgressIndicator(
              value: state.progress,
              backgroundColor: Colors.black,
            ),
            onTap: () {
              context
                  .read<FileDownloadCubit>()
                  .downloadFileIfExists(fileInfo: fileInfo);
            },
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.file_open),
            ),
          );
        },
      ),
    );
  }
}
