class Student{
  int? id;
  String? name;
  String? phoneNum;
  String? brach;

  Student({this.id, this.name, this.phoneNum, this.brach});

  Student copyWith({
int? id,
  String? name,
  String? phoneNum,
  String? brach,
  }){
return Student(id: id ?? this.id, name: name ?? this.name, phoneNum: phoneNum ?? this.phoneNum, brach: brach ?? this.brach);
  }
}