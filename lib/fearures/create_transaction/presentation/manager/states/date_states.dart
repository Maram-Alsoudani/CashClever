abstract class DateState{}
class DateInitialState extends DateState{}
class DateUpdatedState extends DateState{
  DateTime updatedDate;
  DateUpdatedState({required this.updatedDate});
}
