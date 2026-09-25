import 'package:intl/intl.dart';

class Utils {
  String formatCurrency(double valor) {
    final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return formatter.format(valor);
  }
}
