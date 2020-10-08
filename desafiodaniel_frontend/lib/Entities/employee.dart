class Employee {
  int _idEmployee;
  String _name;
  String _sex;
  String _birthDate;
  double _salary;

  Employee(
      this._idEmployee, this._name, this._sex, this._birthDate, this._salary);

  Employee.fromJson(Map<String, dynamic> parsedJson)
      : this(parsedJson['idEmployee'], parsedJson['name'], parsedJson['sex'],
            parsedJson['birthDate'], parsedJson['salary']);

  int get id => _idEmployee;
  String get name => _name;
  String get sex {
    if (_sex == null) {
      return "Não informado";
    }
    return _sex;
  }

  String get birthDate {
    String birth = _birthDate.split("T")[0];
    return birth;
  }

  double get salary => _salary;

  @override
  String toString() {
    return 'Employee{_id_employee: $_idEmployee, _name: $_name, _sex: $_sex, _birth_date: $_birthDate, _salary: $_salary}';
  }
}
