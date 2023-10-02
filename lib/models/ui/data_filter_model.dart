class DataFilterModel{
  final String title;
  DateTime? s;
  DateTime? l;
  bool custom;
  DataFilterModel({required this.title,  this.s,  this.l,this.custom = false});
}
DateTime today = DateTime.now();

List<DataFilterModel> dateFilters = [
  DataFilterModel(title: "Past Week",s: today.subtract(Duration(days: 7)),l: today),
  DataFilterModel(title: "Past Month",s: today.subtract(Duration(days: 30)),l: today),
  DataFilterModel(title: "Past Year",s: today.subtract(Duration(days: 365)),l: today),
  DataFilterModel(title: "All Time"),
  DataFilterModel(title: "Next 6 Months",s: today,l: today.add(Duration(days: 30*6))),
  DataFilterModel(title: "Custom",custom: true),
];

