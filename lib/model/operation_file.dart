//TODO: remove id
class Operations {
  int? id;
  String ?operation;
  String ?dataTime;

  Operations({this.id, this.operation, this.dataTime});

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['operation'] = operation;
    map['dataTime'] = dataTime;
    return map;
  }

  Operations.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    operation = map['operation'];
    dataTime = map['dataTime'];
  }
}
