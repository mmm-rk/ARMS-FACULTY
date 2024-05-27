import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({super.key});

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _questionController = TextEditingController();
  final List<String> _difficultyLevels = ['Easy', 'Medium', 'Hard'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Question'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopicCoveredSection(),
              SizedBox(height: 16),
              _buildDifficultyDropdown(),
              SizedBox(height: 16),
              _buildQuestionTextField(),
              SizedBox(height: 16),
              _buildOptionsSection(),
              SizedBox(height: 16),
              _buildAddOptionButton(context),
              SizedBox(height: 16),
              _buildSubmitButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopicCoveredSection() {
    return Consumer<QuestionProvider>(
      builder: (context, provider, child) {
        return Wrap(
          spacing: 8.0,
          children: provider.topics.map((topic) {
            return ChoiceChip(
              label: Text(topic),
              selected: provider.selectedTopics.contains(topic),
              onSelected: (selected) {
                provider.toggleTopic(topic);
              },
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildDifficultyDropdown() {
    return Consumer<QuestionProvider>(
      builder: (context, provider, child) {
        return DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: 'Level of Difficulty',
            border: OutlineInputBorder(),
          ),
          value: provider.selectedDifficulty,
          items: _difficultyLevels.map((String difficulty) {
            return DropdownMenuItem<String>(
              value: difficulty,
              child: Text(difficulty),
            );
          }).toList(),
          onChanged: (newValue) {
            provider.setDifficulty(newValue!);
          },
        );
      },
    );
  }

  Widget _buildQuestionTextField() {
    return TextField(
      controller: _questionController,
      decoration: InputDecoration(
        labelText: 'Question',
        border: OutlineInputBorder(),
      ),
      maxLines: null,
    );
  }

  Widget _buildOptionsSection() {
    return Consumer<QuestionProvider>(
      builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: provider.options.asMap().entries.map((entry) {
            int index = entry.key;
            String option = entry.value;

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Option ${index + 1}',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (newValue) {
                        provider.updateOption(index, newValue);
                      },
                    ),
                  ),
                  Checkbox(
                    value: provider.correctAnswerIndex == index,
                    onChanged: (newValue) {
                      if (newValue != null && newValue) {
                        provider.setCorrectAnswerIndex(index);
                      }
                    },
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildAddOptionButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Provider.of<QuestionProvider>(context, listen: false).addOption();
      },
      child: Text('Add Option'),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final provider = Provider.of<QuestionProvider>(context, listen: false);
        provider.setQuestion(_questionController.text);
        provider.submitQuestion();
      },
      child: Text('Submit Question'),
    );
  }
}

class QuestionProvider extends ChangeNotifier {
  String? selectedDifficulty;
  String question = '';
  int? correctAnswerIndex;
  List<String> options = [''];
  List<String> selectedTopics = [];

  List<String> topics = ['Math', 'Science', 'History', 'Geography'];

  void toggleTopic(String topic) {
    if (selectedTopics.contains(topic)) {
      selectedTopics.remove(topic);
    } else {
      selectedTopics.add(topic);
    }
    notifyListeners();
  }

  void setDifficulty(String difficulty) {
    selectedDifficulty = difficulty;
    notifyListeners();
  }

  void setQuestion(String newQuestion) {
    question = newQuestion;
    notifyListeners();
  }

  void addOption() {
    options.add('');
    notifyListeners();
  }

  void updateOption(int index, String newValue) {
    options[index] = newValue;
    notifyListeners();
  }

  void setCorrectAnswerIndex(int index) {
    correctAnswerIndex = index;
    notifyListeners();
  }

  void submitQuestion() {
    print('Topics Covered: $selectedTopics');
    print('Difficulty: $selectedDifficulty');
    print('Question: $question');
    print('Options: $options');
    print('Correct Answer Index: $correctAnswerIndex');
  }
}
