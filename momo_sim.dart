// Student: Hamid Ahmed Elmahdi Ahmed
// Reg no: 257982024
const String regNo = '257982024';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int momoFee(int amount) {
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

String formatRwf(int amount) {
  bool negative = amount < 0;
  String number = amount.abs().toString();
  String reversed = '';
  int i = number.length - 1;
  int count = 0;

  while (i >= 0) {
    reversed += number[i];
    count++;

    if (count % 3 == 0 && i != 0) {
      reversed += ',';
    }
    i--;
  }

  String formatted = '';
  i = reversed.length - 1;

  while (i >= 0) {
    formatted += reversed[i];
    i--;
  }

  if (negative) {
    formatted = '-$formatted';
  }

  return '$formatted RWF';
}

bool isValidPin(String pin) {
  if (pin.length != 5 || pin == '12345') {
    return false;
  }

  int i = 0;

  while (i < pin.length) {
    int code = pin.codeUnitAt(i);

    if (code < 48 || code > 57) {
      return false;
    }
    i++;
  }

  if (pin[0] == pin[1] &&
      pin[1] == pin[2] &&
      pin[2] == pin[3] &&
      pin[3] == pin[4]) {
    return false;
  }

  return true;
}

int sendMoney(int balance, int amount) {
  int fee = momoFee(amount);

  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }

  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  balance -= amount + fee;

  print(
    'Sent ${formatRwf(amount)} '
    '(fee ${formatRwf(fee)}). '
    'New balance: ${formatRwf(balance)}',
  );

  return balance;
}

int buyAirtime(int balance, int amount) {
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid amount');
    return balance;
  }

  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  balance -= amount;

  print(
    'Airtime purchased: ${formatRwf(amount)}. '
    'New balance: ${formatRwf(balance)}',
  );

  return balance;
}

void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  // PIN validation tests
  print(isValidPin('12345'));
  print(isValidPin('77777'));
  print(isValidPin('4821'));
  print(isValidPin('48a21'));
  print(isValidPin('48214'));

  // Starting balance
  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  // Send money three times
  int amount = (d + 1) * 3000;

  balance = sendMoney(balance, amount);
  balance = sendMoney(balance, amount);
  balance = sendMoney(balance, amount);

  // Buy airtime
  balance = buyAirtime(balance, 1000);

  // Test invalid and large transactions
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  // Final balance
  print('Final balance: ${formatRwf(balance)}');

  // Additional formatRwf tests
  print(formatRwf(0));
  print(formatRwf(999));
  print(formatRwf(1000));
  print(formatRwf(1250000));
  print(formatRwf(-5000));

  // Additional isValidPin tests
  print(isValidPin('12346'));
  print(isValidPin('11111'));
  print(isValidPin('12a45'));
  print(isValidPin('1234'));
  print(isValidPin('99998'));
}