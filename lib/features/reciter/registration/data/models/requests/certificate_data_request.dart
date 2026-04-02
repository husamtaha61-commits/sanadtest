import 'package:image_picker/image_picker.dart';

class CertificateDataRequest {
  final int recitationId;
  final int recitationTypeId;
  final XFile certificateFile;

  CertificateDataRequest({
    required this.recitationId,
    required this.recitationTypeId,
    required this.certificateFile,
  });
}
