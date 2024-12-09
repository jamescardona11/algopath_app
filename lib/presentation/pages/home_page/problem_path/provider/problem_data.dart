import 'package:algopath_app/domain/problem/problem.dart';

sealed class ListElementData {
  bool get isProblemData => this is ProblemData;
  bool get isSectionData => this is SectionData;
}

class ProblemData extends ListElementData {
  final Problem problem;
  ProblemData(this.problem);
}

class SectionData extends ListElementData {
  final String title;
  final bool isExpanded;

  SectionData({
    required this.title,
    this.isExpanded = false,
  });
}
