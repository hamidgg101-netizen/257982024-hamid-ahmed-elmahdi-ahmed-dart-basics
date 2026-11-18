// Student: Hamid Ahmed Elmahdi Ahmed
// Reg no: 257982024
const String regNo = '257982024';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

void main() {
  print('Reg no: $regNo | D = $d | T = $t');
}
