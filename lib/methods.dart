class Methods {
  Methods(this.strValue);

  ///Get string 1 2 3 4
  final String strValue;

  List<int> get listNumber =>
      strValue.split(' ').map((e) => int.parse(e)).toList();

  int get minNumber => listNumber.reduce((a, b) => a < b ? a : b);

  int get maxNumber => listNumber.reduce((a, b) => a > b ? a : b);

  int get total => listNumber.reduce((a, b) => a + b);

  List<int> get listEven => listNumber.where((e) => e % 2 == 0).toList();

  List<int> get listOdd => listNumber.where((e) => e % 2 != 0).toList();
  
  ///Result min man: 10 14
  String get minMaxSumResult {
    int sumMinium = total - maxNumber;
    int sumMaxium = total - minNumber;
    return '$sumMinium $sumMaxium';
  }
}
