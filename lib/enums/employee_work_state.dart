enum EmployeeWorkState {
  early,
  late,
  absence;

  factory EmployeeWorkState.fromString(String? value) => switch (value) {
        "early" => early,
        "late" => late,
        _ => absence,
      };

  @override
  String toString() => switch (this) {
        early => "early",
        late => "late",
        absence => "absence",
      };
}