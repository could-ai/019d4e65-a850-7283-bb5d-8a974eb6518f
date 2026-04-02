import 'package:flutter/material.dart';

class Transaction {
  final String title;
  final String date;
  final double amount;
  final bool isCredit;
  final String status;

  Transaction({
    required this.title,
    required this.date,
    required this.amount,
    required this.isCredit,
    required this.status,
  });
}

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for transactions in Bahasa Malaysia
    final List<Transaction> transactions = [
      Transaction(
        title: 'Gaji (Syarikat ABC)',
        date: '25 Okt 2023, 10:00 PG',
        amount: 5000.00,
        isCredit: true,
        status: 'Berjaya',
      ),
      Transaction(
        title: 'Pembayaran Bil Elektrik',
        date: '24 Okt 2023, 08:30 MLM',
        amount: 150.50,
        isCredit: false,
        status: 'Berjaya',
      ),
      Transaction(
        title: 'Pindahan Wang ke Ali',
        date: '22 Okt 2023, 02:15 PTG',
        amount: 50.00,
        isCredit: false,
        status: 'Berjaya',
      ),
      Transaction(
        title: 'Barangan Runcit (Pasaraya)',
        date: '20 Okt 2023, 11:45 PG',
        amount: 230.00,
        isCredit: false,
        status: 'Gagal',
      ),
      Transaction(
        title: 'Pulangan Dana (Shopee)',
        date: '18 Okt 2023, 09:00 PG',
        amount: 45.00,
        isCredit: true,
        status: 'Berjaya',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sejarah Transaksi'),
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: Container(
        color: Colors.grey[100],
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 12, bottom: 24),
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final tx = transactions[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: tx.isCredit ? Colors.green[100] : Colors.red[100],
                    child: Icon(
                      tx.isCredit ? Icons.arrow_downward : Icons.arrow_upward,
                      color: tx.isCredit ? Colors.green[800] : Colors.red[800],
                    ),
                  ),
                  title: Text(
                    tx.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),
                      Text(
                        tx.date,
                        style: TextStyle(color: Colors.grey[600], fontSize: 13),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            tx.status == 'Berjaya' ? Icons.check_circle : Icons.cancel,
                            size: 14,
                            color: tx.status == 'Berjaya' ? Colors.green : Colors.red,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            tx.status,
                            style: TextStyle(
                              color: tx.status == 'Berjaya' ? Colors.green : Colors.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: Text(
                    '${tx.isCredit ? '+' : '-'} RM ${tx.amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: tx.isCredit ? Colors.green[800] : Colors.black87,
                    ),
                  ),
                  isThreeLine: true,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
