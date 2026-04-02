import '../../../../core/entities/base_field.dart';
import '../../data/models/responses/program_response.dart';

class Program {
  final int id;
  final double price;
  final int numberOfSessions;
  final BaseField programType;
  final List<BaseField> programDescription;
  final BaseField programSubTitle;

  Program({
    required this.id,
    required this.price,
    required this.numberOfSessions,
    required this.programType,
    required this.programDescription,
    required this.programSubTitle,
  });

  factory Program.fromResponse(ProgramResponse? response) {
    if (response == null) {
      return Program(
        id: -1,
        price: 0.0,
        numberOfSessions: 0,
        programType: BaseField.fromResponse(null),
        programDescription: [],
        programSubTitle: BaseField.fromResponse(null),
      );
    }
    return Program(
      id: response.id ?? -1,
      price: response.price ?? 0.0,
      numberOfSessions: response.numberOfSessions ?? 0,
      programType: BaseField.fromResponse(response.programType),
      programDescription: (response.programDescription ?? [])
          .map((ele) => BaseField.fromResponse(ele))
          .toList(),
      programSubTitle: BaseField.fromResponse(response.programSubTitle),
    );
  }
}
