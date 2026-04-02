import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

@JsonSerializable()
class CertificateData {
  final int recitationId;
  final int recitationTypeId;
  @JsonKey(ignore: true)
  final XFile? certificateFile;
  final String recitationName;
  final String recitationTypeName;

  CertificateData({
    required this.recitationId,
    required this.recitationTypeId,
    this.certificateFile,
    this.recitationName = '',
    this.recitationTypeName = '',
  });

  CertificateData copyWith({
    int? recitationId,
    int? recitationTypeId,
    XFile? certificateFile,
    String? recitationName,
    String? recitationTypeName,
  }) {
    return CertificateData(
      recitationId: recitationId ?? this.recitationId,
      recitationTypeId: recitationTypeId ?? this.recitationTypeId,
      certificateFile: certificateFile ?? this.certificateFile,
      recitationName: recitationName ?? this.recitationName,
      recitationTypeName: recitationTypeName ?? this.recitationTypeName,
    );
  }
}
