import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';

import '../core/models/base_status.dart';
import '../core/network/dio_client.dart';
import '../core/utils/snackbar.dart';

import '../core/widgets/app_error_widget.dart';
import '../core/widgets/app_loading_indicator.dart';
import 'student/subscription/data/models/responses/get_random_quran_response.dart';
import 'student/subscription/presentation/bloc/get_random_quran/get_random_quran_cubit.dart';

class Quran extends StatefulWidget {
  final GetRandomQuranResponse quranTemplate;
  const Quran({super.key, required this.quranTemplate});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  bool isFontLoaded = false;

  // Get the font for the first part
  void getPartFont() {
    List<int> pageNumbers = [];
    for (var i = 0; i < widget.quranTemplate.verses.length; i++) {
      if (!pageNumbers
          .contains(widget.quranTemplate.verses[i].pageNumber)) {
        pageNumbers.add(widget.quranTemplate.verses[i].pageNumber);
      }
    }
    for (var num in pageNumbers) {
      loadFont(
        url: "https://quran.com/fonts/quran/hafs/v1/ttf/p$num.ttf",
        fontName: 'sanadQuranFont$num',
      );
    }
  }

  Future<void> loadFont({required String url, required String fontName}) async {
    try {
      final fontFile = await downloadFont(url: url, fontName: fontName);
      final fontLoader = FontLoader(fontName);
      fontLoader.addFont(getFontLoaderBytes(fontFile));
      await fontLoader.load();
    } catch (e) {
      showGlobalSnackBar("Failed to load font", SnackBarStatus.error);
    }
  }

  Future<File> downloadFont({
    required String url,
    required String fontName,
  }) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fontFile = File('${appDir.path}/$fontName');

    final response =
        await DioClient.createDio(addLogInterceptors: false).download(
      url,
      fontFile.path,
      options: Options(responseType: ResponseType.bytes),
    );

    if (response.statusCode == 200) {
      return fontFile;
    } else {
      throw Exception('Failed to download font: ${response.statusCode}');
    }
  }

  Future<ByteData> getFontLoaderBytes(File file) async {
    try {
      final bytes = await file.readAsBytes();
      if (mounted) {
        context.read<GetRandomQuranCubit>().setFontLoaded();
      }
      return ByteData.view(bytes.buffer);
    } catch (e) {
      throw Exception("Failed to get font loader bytes: $e");
    }
  }

  Map<int, String> joinVersesByPageNumber(List<VerseResponse> verses) {
    // Create a map to store the concatenated codeV1 for each quranPageNumber
    Map<int, String> joinedVersesByPage = {};

    for (var verse in verses) {
      int pageNumber = verse.pageNumber;
      String codeV1 = verse.codeV1;

      // If the page number already exists in the map, concatenate the codeV1
      if (joinedVersesByPage.containsKey(pageNumber)) {
        joinedVersesByPage[pageNumber] =
            "${joinedVersesByPage[pageNumber]!} $codeV1";
      } else {
        // If it's a new page, add the codeV1
        joinedVersesByPage[pageNumber] = codeV1;
      }
    }

    return joinedVersesByPage;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // No need for BlocBuilder here [mostly]
    return BlocBuilder<GetRandomQuranCubit, GetRandomQuranState>(
      builder: (context, getRandomQuranState) {
        if (getRandomQuranState.status is Loading) {
          return const AppLoadingIndicator();
        } else if (getRandomQuranState.status is Failure) {
          return AppErrorWidget(
            retryFunc: () =>
                BlocProvider.of<GetRandomQuranCubit>(context).getRandomQuran(),
          );
        }
        getPartFont();

        Map<int, String> result =
            joinVersesByPageNumber(getRandomQuranState.quranTemplate!.verses);

        return getRandomQuranState.isFontLoaded
            ? SingleChildScrollView(
                padding: EdgeInsets.only(
                  right: 10.w,
                  left: 10.w,
                  bottom: 10.w,
                ),
                child: RichText(
                  textDirection: TextDirection.rtl,
                  text: TextSpan(
                    children: result.entries.expand((entry) {
                      return [
                        TextSpan(
                          text: entry.value,
                          style: TextStyle(
                            overflow: TextOverflow.visible,
                            fontSize: entry.key == 2 ? 28.sp : 24.sp,
                            color: Colors.black,
                            fontFamily: 'sanadQuranFont${entry.key}',
                          ),
                        ),
                        WidgetSpan(child: SizedBox(width: 5.w)),
                      ];
                    }).toList(),
                  ),
                ),
              )
            : const AppLoadingIndicator();
      },
    );
  }
}
