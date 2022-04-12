class Lesson {
  final String name;
  final double letterGrade;
  final int credit;

  const Lesson(
      {required this.name, required this.letterGrade, required this.credit});

  @override
  String toString() {
    return "LessonName: $name, LetterGrade: $letterGrade, Credit: $credit";
  }
}
