import 'package:algopath_app/domain/problem/problem.dart';
import 'package:algopath_app/utils/strings_extension.dart';

class SectionData {
  final String title;
  final bool isExpanded;
  final List<Problem> problems;

  SectionData._({
    required this.title,
    required this.problems,
    this.isExpanded = false,
  });

  factory SectionData({
    String title = '',
    required List<Problem> problems,
    bool isExpanded = false,
  }) {
    return SectionData._(
      title: title.capitalize(),
      problems: problems,
      isExpanded: isExpanded,
    );
  }

  bool get isNoGroup => title.isEmpty;
}
