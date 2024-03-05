enum Operation { addition, subtraction, division, multiplication }

extension OperationExtension on Operation {
  String get displayTitle {
    switch (this) {
      case Operation.addition:
        return '+';
      case Operation.subtraction:
        return '-';
      case Operation.division:
        return '÷';
      case Operation.multiplication:
        return '✕';
    }
  }
}