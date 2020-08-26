import 'package:state_management/models/item_model.dart';

String formatTotal(List<ItemModel> list) {
  return list.length > 0
      ? list
          .map<double>((m) => m.price)
          .reduce((a, b) => a + b)
          .toStringAsFixed(2)
      : 0.toStringAsFixed(2);
}
