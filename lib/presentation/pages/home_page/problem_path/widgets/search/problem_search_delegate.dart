import 'package:flutter/material.dart';
import 'package:algopath_app/presentation/widgets/problem_item.dart';

class ProblemSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Here you would typically filter your problems based on the query
    if (query.isEmpty) {
      return const Center(
        child: Text('Type something to search'),
      );
    }

    return ListView(
      children: [
        if (query.toLowerCase().contains('dynamic'))
          ProblemListItem(
            number: '416',
            title: 'Partition Equal Subset Sum',
            tags: ['Dynamic Programming', 'Medium'],
          ),
        if (query.toLowerCase().contains('tree'))
          ProblemListItem(
            number: '124',
            title: 'Binary Tree Maximum Path Sum',
            tags: ['Depth-first Search', 'Tree', 'Hard'],
          ),
        // Add more filtered items based on query
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Here you would show search suggestions
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.history),
          title: const Text('Dynamic Programming'),
          onTap: () {
            query = 'Dynamic Programming';
            showResults(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.history),
          title: const Text('Tree Problems'),
          onTap: () {
            query = 'Tree';
            showResults(context);
          },
        ),
        // Add more suggestions
      ],
    );
  }
}
