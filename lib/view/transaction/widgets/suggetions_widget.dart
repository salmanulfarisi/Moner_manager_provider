import 'package:money_manager/model/transaction_model/transaction_model.dart';

final List<String> suggestionList = [];

class SuggestionList {
  void suggetion({required List<TransactionModel> entireData}) {
    if (entireData.isEmpty) {
      return;
    }
    for (TransactionModel data in entireData) {
      if (data.category.isNotEmpty) {
        suggestionList.add(data.category);
      }
    }
  }

  static List<String> getSuggestions(String query) => List.of(suggestionList)
      .where((suggestion) {
        final suggestionLower = suggestion.toLowerCase();
        final queryLower = query.toLowerCase();

        return suggestionLower.contains(queryLower);
      })
      .toSet()
      .toList();
}
