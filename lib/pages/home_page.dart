import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int questionIndex = 0;
  bool showResultsMessage = false;
  int totalScore = 0;

  List<Map<String, dynamic>> questionsWithAnswers = [
    {
      'question': 'What is your favorite Sport?',
      'answers':[
        {'text': 'Football','score': 0},
        {'text': 'Tennis','score': 0},
        {'text': 'Basketball','score': 1},
        {'text': 'Volleyball','score': 0},
        ],
    },
    {
      'question': 'What is your favorite Color?',
      'answers':[
        {'text': 'Green','score': 0},
        {'text': 'Blue','score': 0},
        {'text': 'Red','score': 1},
        {'text': 'White','score': 0},
        ],
    },
    {
      'question': 'What is your favorite Animal?',
      'answers':[
        {'text': 'Camel','score': 0},
        {'text': 'Horse','score': 1},
        {'text': 'Dog','score': 0},
        {'text': 'Cat','score': 0},
        ],
    },
  ];

  void resetQuiz(){
    setState(() {
      questionIndex = 0;
      showResultsMessage = false;
      totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    final questionWithAnswer = questionsWithAnswers[questionIndex] ;

    final answerTexts = (questionWithAnswer['answers'] as List<Map<String,Object>>).map(
                                (answer){
                                return answer['text'] as String;
                              }).toList(); 

    final answerScores = (questionWithAnswer['answers'] as List<Map<String,Object>>).map(
                                (answer){
                                return answer['score'] as int;
                              }).toList();
  
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          leading: const Icon(Icons.menu),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if(showResultsMessage == false)...[
                    Text(
                      questionWithAnswer['question'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16.0), 
                    for(int i = 0; i< questionWithAnswer['answers'].length; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom:12.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if(questionIndex < questionsWithAnswers.length-1){
                                  questionIndex++;                                 
                                }else{
                                  showResultsMessage = true;
                                }
                                totalScore+=answerScores[i]; 
                              });
                            },
                            child: Text(
                              answerTexts[i],
                              style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ),
                        ),
                      ),
                  ],
                  if(showResultsMessage == true)...[
                    const Text(
                      'Congratulations!',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Your Score is : $totalScore / ${questionsWithAnswers.length}',
                       style: const TextStyle(
                          fontSize: 20,
                       ),
                      ),
                    const SizedBox(height: 8.0),
                    TextButton(
                      onPressed: resetQuiz,
                      child: const Text(
                        'Reset Quiz',
                        style:  TextStyle(
                          fontSize: 18,
                       ),
                      )
                    ),
                  ],
                ],
            ),
          ),
        ),
    );
  }
}

              //العنصر الواحد داخل ال map هو wedgit وليس list 
              // children: questionsWithAnswers.map( (questionWithAnswer) => Column(
              //     children: [
              //       Text(questionWithAnswer['question']), 
              //       for(int i = 0; i< questionWithAnswer['answers'].length; i++)
              //        ElevatedButton(
              //          onPressed: (){},
              //          child: Text(questionWithAnswer['answers'][i])
              //        ), 
              //     ],
              //   ),
              // ).toList(),


                    // Column(
                    //   children: (questionWithAnswer['answers'] as List<String>).map(
                    //     (item){
                    //       return ElevatedButton(
                    //         onPressed: (){},
                    //          child: Text(item)
                    //       );
                    //     },
                    //   ).toList(),
                    // ),

                    // List<String> names =['r','a','b'];
                    // List<String> employeeNames =['s','y',...names];
                    // print(employeeNames);  // [s, y, r, a, b] 