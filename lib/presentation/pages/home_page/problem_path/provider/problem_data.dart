import 'package:algopath_app/domain/problem/problem.dart';

abstract class ListElementData {
  bool get isProblemData => this is ProblemData;
  bool get isSectionData => this is SectionData;
}

class ProblemData extends ListElementData {
  final Problem problem;

  ProblemData(this.problem);
}

class SectionData<T> extends ListElementData {
  final T section;
  final bool isExpanded;

  SectionData({
    required this.section,
    this.isExpanded = false,
  });
}
