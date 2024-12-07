abstract class SearchRegex {
  static RegExp searchKeyRegExp(String searchTerm, {bool shouldSplit = false}) => RegExp(
        searchTerm.toLowerCase().split(' ').where((element) => element.isNotEmpty).map((word) => RegExp.escape(word)).join('|'),
        caseSensitive: false,
      );
}
