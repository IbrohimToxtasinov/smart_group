import 'package:equatable/equatable.dart';

class FileDownloadState extends Equatable {
  FileDownloadState({required this.progress, required this.newFileLocation});

  final double progress;
  final String newFileLocation;

  FileDownloadState copyWith({
    double? progress,
    String? newFileLocation,
  }) =>
      FileDownloadState(
          progress: progress ?? this.progress,
          newFileLocation: newFileLocation ?? this.newFileLocation);

  @override
  List<Object?> get props => [progress, newFileLocation];
}
