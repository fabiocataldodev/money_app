import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:money_app/src/data/models/transaction_model.dart';

class HomeController extends GetxController {
  RxDouble initialAmount = 150.25.obs;
  final box = GetStorage();
  RxList<TransactionModel> transactions = <TransactionModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTransactions();
  }

  void loadTransactions() {
    final List<dynamic> storedTransactions = box.read('transactions') ?? [];
    transactions.value = storedTransactions
        .map((item) => TransactionModel.fromMap(item))
        .toList();

    sortTransactions();

    updateTotalAmount();
  }

  void sortTransactions() {
    transactions.sort((a, b) => b.date.compareTo(a.date));
  }

  void updateTotalAmount() {
    double totalTransactionValue = transactions.fold(
        0.0, (sum, transaction) => sum + double.parse(transaction.amount));
    initialAmount.value = 150.25 - totalTransactionValue;
  }

  void deleteTransaction(int index) {
    transactions.removeAt(index);
    saveTransactions();
    updateTotalAmount();
  }

  void addTransaction(TransactionModel transaction) {
    transactions.add(transaction);
    sortTransactions();
    saveTransactions();
    updateTotalAmount();
  }

  void saveTransactions() {
    final updatedTransactions = transactions.map((tx) => tx.toMap()).toList();
    box.write('transactions', updatedTransactions);
  }
}
