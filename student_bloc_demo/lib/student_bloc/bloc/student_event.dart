part of 'student_bloc.dart';

@immutable
abstract class StudentEvent extends Equatable{
  const StudentEvent();
 @override
  List<Object?> get props => [];
}

class GetStudentList extends StudentEvent{
GetStudentList();
}

class StudentCreate extends StudentEvent{
final Student? studentObj; 
const StudentCreate({this.studentObj});
}

class StudentUpdate extends StudentEvent{
  final Student? studentObj; 
  const StudentUpdate({this.studentObj});
}

class StudentDelete extends StudentEvent{
  final int? studentId; 
  const StudentDelete({this.studentId});
}
