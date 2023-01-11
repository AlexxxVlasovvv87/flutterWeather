class ConditionDto {
  final String text;
  final String icon;

  //Состояние, которое присылается в api

  ConditionDto({required this.text, required this.icon});

  @override
  String toString() {
    return """
    text = $text
    icon = $icon
    """;
  }
}
