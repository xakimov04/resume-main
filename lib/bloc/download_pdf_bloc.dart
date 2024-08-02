import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

part 'download_pdf_event.dart';
part 'download_pdf_state.dart';

class DownloadPdfBloc extends Bloc<PdfEvent, DownloadPdfState> {
  DownloadPdfBloc() : super(InitialPdfState()) {
    on<DownloadPdfEvent>(_onDownloadPdf);
  }

  final Dio _dio = Dio();

  Future<void> _onDownloadPdf(
    DownloadPdfEvent event,
    Emitter<DownloadPdfState> emit,
  ) async {
    emit(LoadingPdfState()); 

    if (await _requestPermissions()) {
      final savePath = await _getSavePath();
      try {
        await _dio.download('https://msnlabs.com/img/resume-sample.pdf', savePath);
        emit(LoadedPdfState());
      } catch (e) {
        emit(ErrorPdfState(e.toString()));
      }
    } else {
      emit(ErrorPdfState('Storage permission not granted'));
    }
  }

  Future<String> _getSavePath() async {
    final Directory savePath;

    if (Platform.isAndroid) {
      savePath = Directory("/storage/emulated/0/download");
    } else {
      savePath = await getApplicationDocumentsDirectory();
    }

    final fullPath = "${savePath.path}/cv713.pdf";
    return fullPath;
  }

  Future<bool> _requestPermissions() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
    }
    return status.isGranted;
  }
}
