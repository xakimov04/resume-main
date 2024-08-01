import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

part 'download_pdf_event.dart';
part 'download_pdf_state.dart';

class DownloadPdfBloc extends Bloc<PdfEvent, DownloadPdfState> {
  DownloadPdfBloc() : super(InitialPdfState()) {
    on<DownloadPdfEvent>(_onDownloadPdf);
  }
  final Dio _dio = Dio();

  void _onDownloadPdf(
    DownloadPdfEvent event,
    Emitter<DownloadPdfState> emit,
  ) async {
    print("------------------------");
    final savePath = await _getSavePath();
    await _dio.download('https://msnlabs.com/img/resume-sample.pdf', savePath);
    emit(LoadedPdfState());
  }

  Future<String> _getSavePath() async {
    Directory? savePath = await getApplicationDocumentsDirectory();
    if (Platform.isAndroid) {
      savePath = Directory("/storage/emulated/0/download");
    }
    final fullPath = "${savePath.path}/cv713.pdf";

    return fullPath;
  }

  Future<void> _downloadPdfIsolate(String url) async {
    final Dio dio = Dio();
    final Directory savePath = await getApplicationDocumentsDirectory();
    final String filePath = "${savePath.path}/resume.pdf";
    await dio.download(url, filePath);
  }
}
