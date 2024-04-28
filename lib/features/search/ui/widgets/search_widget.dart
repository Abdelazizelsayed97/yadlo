import 'package:flutter/material.dart';

class SearchWidget extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
      return ListTile(
        title: Text('Suggestions'),
        onTap: () {
          query = '';
          close(context, query);
        },
      );
    }, separatorBuilder: (context, index) {
      return Divider();
    }, itemCount: 5);
  }
}

