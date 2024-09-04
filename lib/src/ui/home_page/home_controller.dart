import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:money_app/src/data/models/transaction_model.dart';
import 'package:money_app/src/ui/currency_converter/currency_converter_page.dart';

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
    double totalTopups = transactions
        .where((transaction) => transaction.type == TransactionType.topup)
        .fold(
            0.0, (sum, transaction) => sum + double.parse(transaction.amount));

    double totalPurchases = transactions
        .where((transaction) => transaction.type == TransactionType.purchase)
        .fold(
            0.0, (sum, transaction) => sum + double.parse(transaction.amount));

    initialAmount.value = 150.25 + totalTopups - totalPurchases;
  }

  void deleteTransaction(String id) {
    transactions.removeWhere((transaction) => transaction.id == id);
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

  void addSampleTransactions() {
    transactions.addAll([
      TransactionModel(
        type: TransactionType.purchase,
        title: 'Grocery',
        amount: '20.00',
        date: DateTime.now().subtract(const Duration(days: 0)),
      ),
      TransactionModel(
        type: TransactionType.topup,
        title: 'Salary',
        amount: '1500.00',
        date: DateTime.now().subtract(const Duration(days: 1)),
      ),
      TransactionModel(
        type: TransactionType.purchase,
        title: 'Coffee',
        amount: '5.00',
        date: DateTime.now().subtract(const Duration(days: 5)),
      ),
      TransactionModel(
        type: TransactionType.topup,
        title: 'Bonus',
        amount: '300.00',
        date: DateTime.now().subtract(const Duration(days: 10)),
      ),
      TransactionModel(
        type: TransactionType.purchase,
        title: 'Book',
        amount: '15.00',
        date: DateTime.now().subtract(const Duration(days: 30)),
      ),
    ]);

    saveTransactions();
    loadTransactions();
  }

  void onIconPressed() {
    Get.to(() => const CurrencyConverterPage());
  }

  void onIconLongPress() {
    addSampleTransactions();
  }
}
