// Student: Hamid Ahmed Elmahdi Ahmed
// Reg no: 257982024

const String regNo = '257982024';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// B2: Count Vowels
int countVowels(String text) {
  int count = 0;
  text = text.toLowerCase();

  int i = 0;
  while (i < text.length) {
    if ('aeiou'.contains(text[i])) {
      count++;
    }
    i++;
  }

  return count;
}

// B3: Initials
String initials(String fullName) {
  String name = fullName.trim();

  if (name.isEmpty) {
    return '';
  }

  List<String> names = name.split(RegExp(r'\s+'));
  String result = '';

  int i = 0;
  while (i < names.length) {
    result += '${names[i][0].toUpperCase()}.';
    i++;
  }

  return result;
}

// C5: Draw Triangle
void drawTriangle(int height) {
  int row = 1;

  while (row <= height) {
    String spaces = '';
    String symbol = '';

    int s = 0;
    while (s < height - row) {
      spaces += ' ';
      s++;
    }

    String character = row % 2 == 0 ? '#' : '*';

    int j = 0;
    while (j < row) {
      symbol += character;
      j++;
    }

    print(spaces + symbol);
    row++;
  }
}

// D2: MoMo Fee
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

// D2: Mask Phone
String maskPhone(String phone) {
  if (phone.length != 10) {
    return 'INVALID';
  }

  return phone.substring(0, 3) +
      '*****' +
      phone.substring(8);
}

// Main Function
void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  // B2 Tests
  String fullName = 'Hamid Ahmed Elmahdi Ahmed';
  print('$fullName has ${countVowels(fullName)} vowels');

  // B3 Tests
  print(initials(fullName));
  print(initials('ana uwase'));
  print(initials(' '));

  // C5 Tests
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  // D2 Tests
  int i = 1;
  int totalFees = 0;

  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);

    totalFees += fee;

    print(
      'Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone('0788123456')}',
    );

    i++;
  }

  print('Total fees: $totalFees RWF');
} 