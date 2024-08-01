import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_app/logic/bloc/download_pdf_bloc.dart';

import 'core/app.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => DownloadPdfBloc(),
      child: const MainApp(),
    ),
  );
}
