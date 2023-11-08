class Question {
  const Question(this.ques, this.answers);

  final String ques;
  final List<String> answers;

  List<String> getShuffledanswers() {
    final List<String> shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
