class Transfer {
  final int accountNumber;
  final double value;

  Transfer(
    this.accountNumber,
    this.value,
  );

  @override
  String toString() {
    return "Transfer {accountNumer: $accountNumber, value: $value}";
  }
}
