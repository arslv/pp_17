import 'package:pp_17/data/models/lesson_entity.dart';
import 'package:pp_17/data/models/news_model.dart';
import 'package:pp_17/data/models/quiz_entity.dart';
import 'package:pp_17/data/models/sport_card_entity.dart';
import 'package:pp_17/enums/quiz_statuses.dart';
import 'package:pp_17/enums/sport_type.dart';
import 'package:pp_17/helpers/lessons_text.dart';

class ContentEmbedding {
  static List<SportCard> getCards = [
    SportCard(
      type: SportType.football,
      imagePath: 'assets/images/football.png',
      name: 'Football',
      lesson: Lesson(text: LessonsText.football, isPassed: false),
      quizzes: [
        Quiz(
          name: 'Football',
          question: 'How many players make up a football team?',
          answers: ['7', '9', '11', '13'],
          rightAnswer: '11',
          isPassed: false,
        ),
        Quiz(
          name: 'Football',
          question:
              'Which country holds the record for the most victories in the football World Cup?',
          answers: ['Brazil', 'Germany', 'Italy', 'Argentina'],
          rightAnswer: 'Brazil',
          isPassed: false,
        ),
        Quiz(
          name: 'Football',
          question: 'Which player is considered the best footballer of all time?',
          answers: ['Lionel Messi', 'Cristiano Ronaldo', 'Pele', 'Diego Maradona'],
          rightAnswer: 'Pele',
          isPassed: false,
        ),
        Quiz(
          name: 'Football',
          question: 'How many fields are required for an official football match?',
          answers: ['1', '2', '3', '4'],
          rightAnswer: '1',
          isPassed: false,
        ),
        Quiz(
          name: 'Football',
          question:
              'Which football club holds the record for the most victories in the UEFA ChampionsLeague?',
          answers: ['Real Madrid', 'Barcelona', 'Manchester United', ' Bayern Munich'],
          rightAnswer: 'Real Madrid',
          isPassed: false,
        ),
      ],
      quizStatus: QuizStatus.notStarted,
      quizProgress: 0,
    ),
    SportCard(
      type: SportType.basketball,
      imagePath: 'assets/images/basketball.png',
      name: 'Basketball',
      lesson: Lesson(text: LessonsText.basketball, isPassed: false),
      quizzes: [
        Quiz(
          name: 'Basketball',
          question: 'Which country is the birthplace of basketball?',
          answers: ['France', 'Spain', 'USA', 'Germany'],
          rightAnswer: 'USA',
          isPassed: false,
        ),
        Quiz(
          name: 'Basketball',
          question: 'How many players make up a basketball team?',
          answers: ['5', '7', '10', '12'],
          rightAnswer: '5',
          isPassed: false,
        ),
        Quiz(
          name: 'Basketball',
          question: 'What does the term "defense" mean in basketball?',
          answers: [
            'Throwing the ball into the opponent\'s basket',
            'Attempting to intercept the ball from the opponent',
            'Bouncing the ball off the basket board',
            'Passing the ball to a teammate',
          ],
          rightAnswer: 'Attempting to intercept the ball from the opponent',
          isPassed: false,
        ),
        Quiz(
          name: 'Basketball',
          question:
              'How many points does a team get if a player throws the ball into the opponent\'s basket?',
          answers: ['1', '2', '3', '4'],
          rightAnswer: '2',
          isPassed: false,
        ),
        Quiz(
          name: 'Basketball',
          question: 'What size should a basketball court be?',
          answers: [
            '20 meters in length and 10 meters in width',
            '25 meters in length and 15 meters in width',
            '28 meters in length and 15 meters in width',
            '30 meters in length and 20 meters in width',
          ],
          rightAnswer: '28 meters in length and 15 meters in width',
          isPassed: false,
        ),
      ],
      quizStatus: QuizStatus.notStarted,
      quizProgress: 0,
    ),
    SportCard(
      type: SportType.tennis,
      imagePath: 'assets/images/tennis.png',
      name: 'Tennis',
      lesson: Lesson(text: LessonsText.tennis, isPassed: false),
      quizzes: [
        Quiz(
          name: 'Tennis',
          question: 'Which country is the birthplace of tennis?',
          answers: ['France', 'England', 'Spain', 'USA'],
          rightAnswer: 'England',
          isPassed: false,
        ),
        Quiz(
          name: 'Tennis',
          question: 'What object is used to play tennis?',
          answers: ['Ball', 'Racket', 'Helmet', 'Volleyball net'],
          rightAnswer: 'Racket',
          isPassed: false,
        ),
        Quiz(
          name: 'Tennis',
          question: 'How many players participate in a doubles tennis match?',
          answers: ['1', '2', '3', '4'],
          rightAnswer: '4',
          isPassed: false,
        ),
        Quiz(
          name: 'Tennis',
          question:
              'Which of the following tournaments is one of the four "Grand Slam" tennis tournaments?',
          answers: ['Roland Garros', 'Masters', 'Davis Cup', 'Olympic Games'],
          rightAnswer: 'Roland Garros',
          isPassed: false,
        ),
        Quiz(
          name: 'Tennis',
          question: 'Which of the following characteristics is NOT an advantage of playing tennis?',
          answers: [
            'Physical fitness',
            'Social interaction',
            'Intellectual development',
            'Development of driving skills',
          ],
          rightAnswer: 'Development of driving skills',
          isPassed: false,
        ),
      ],
      quizStatus: QuizStatus.notStarted,
      quizProgress: 0,
    ),
    SportCard(
      type: SportType.golf,
      imagePath: 'assets/images/golf.png',
      name: 'Golf',
      lesson: Lesson(text: LessonsText.golf, isPassed: false),
      quizzes: [
        Quiz(
          name: 'Golf',
          question: 'What is the aim of golf?',
          answers: [
            'To throw the ball into a basketball hoop',
            'To throw the ball into a specially marked target, called a hole',
            'To run across the field and jump over obstacles',
            'To hit the ball as far as possible',
          ],
          rightAnswer: 'To throw the ball into a specially marked target, called a hole',
          isPassed: false,
        ),
        Quiz(
          name: 'Golf',
          question: 'How many holes does a golf course usually have?',
          answers: ['5', '9', '18', '25'],
          rightAnswer: '18',
          isPassed: false,
        ),
        Quiz(
          name: 'Golf',
          question: 'What do players use to hit the ball in golf?',
          answers: ['Football', 'Racket', 'Club', 'Baseball bat'],
          rightAnswer: 'Club',
          isPassed: false,
        ),
        Quiz(
          name: 'Golf',
          question: 'What factors should players consider when choosing a shot in golf?',
          answers: [
            'Ball color',
            'Distance to the hole, wind direction, field terrain, and other conditions',
            'Season',
            'Club brand',
          ],
          rightAnswer: 'Distance to the hole, wind direction, field terrain, and other conditions',
          isPassed: false,
        ),
        Quiz(
          name: 'Golf',
          question: 'Which tournaments are considered prestigious in the golf world?',
          answers: [
            'Football World Championship',
            'Masters',
            'Olympic Games',
            'Basketball World Championship',
          ],
          rightAnswer: 'Masters',
          isPassed: false,
        ),
      ],
      quizStatus: QuizStatus.notStarted,
      quizProgress: 0,
    ),
    SportCard(
      type: SportType.baseball,
      imagePath: 'assets/images/baseball.png',
      name: 'Baseball',
      lesson: Lesson(text: LessonsText.baseball, isPassed: false),
      quizzes: [
        Quiz(
          name: 'Baseball',
          question: 'How many players make up a baseball team?',
          answers: ['5 players', '7 players', '9 players', '11 players'],
          rightAnswer: '9 players',
          isPassed: false,
        ),
        Quiz(
          name: 'Baseball',
          question: 'What is the objective of the game in baseball?',
          answers: ['Score a goal', 'Score points', 'Run across the field', 'Catch the ball'],
          rightAnswer: 'Score points',
          isPassed: false,
        ),
        Quiz(
          name: 'Baseball',
          question: 'How many innings does a baseball game include?',
          answers: ['3 innings', '6 innings', '9 innings', '12 innings'],
          rightAnswer: '9 innings',
          isPassed: false,
        ),
        Quiz(
          name: 'Baseball',
          question: 'What is the player who throws the ball in baseball called?',
          answers: ['Batter', 'Runner', 'Pitcher', 'Baseman'],
          rightAnswer: 'Pitcher',
          isPassed: false,
        ),
        Quiz(
          name: 'Baseball',
          question: 'Which symbol of American culture is baseball?',
          answers: ['Football', 'Basketball', 'Hockey', 'Baseball'],
          rightAnswer: 'Baseball',
          isPassed: false,
        ),
      ],
      quizStatus: QuizStatus.notStarted,
      quizProgress: 0,
    ),
    SportCard(
      type: SportType.hockey,
      imagePath: 'assets/images/hockey.png',
      name: 'Hockey',
      lesson: Lesson(text: LessonsText.hockey, isPassed: false),
      quizzes: [
        Quiz(
          name: 'Hockey',
          question: 'Which country is considered the birthplace of hockey?',
          answers: ['Russia', 'Canada', 'Sweden', 'USA'],
          rightAnswer: 'Canada',
          isPassed: false,
        ),
        Quiz(
          name: 'Hockey',
          question: 'How many players make up a team in ice hockey?',
          answers: ['4', '5', '6', '7'],
          rightAnswer: '6',
          isPassed: false,
        ),
        Quiz(
          name: 'Hockey',
          question: 'What object is used to play hockey?',
          answers: ['Ball', 'Puck', 'Ball', 'Stick'],
          rightAnswer: 'Puck',
          isPassed: false,
        ),
        Quiz(
          name: 'Hockey',
          question: 'How many periods does an ice hockey game last?',
          answers: ['2', '3', '4', '5'],
          rightAnswer: '3',
          isPassed: false,
        ),
        Quiz(
          name: 'Hockey',
          question: 'Which sport is Olympic?',
          answers: ['Football', 'Basketball', 'Hockey', 'Tennis'],
          rightAnswer: 'Hockey',
          isPassed: false,
        ),
      ],
      quizStatus: QuizStatus.notStarted,
      quizProgress: 0,
    ),
    SportCard(
      type: SportType.volleyball,
      imagePath: 'assets/images/volleyball.png',
      name: 'Volleyball',
      lesson: Lesson(text: LessonsText.volleyball, isPassed: false),
      quizzes: [
        Quiz(
          name: 'Volleyball',
          question: 'How many players make up a volleyball team?',
          answers: ['4', '5', '6', '7'],
          rightAnswer: '6',
          isPassed: false,
        ),
        Quiz(
          name: 'Volleyball',
          question: 'What is the objective of the game in volleyball?',
          answers: [
            'Earn the maximum number of points',
            'Throw the ball over the net to the opponent\'s side',
            'Prevent the ball from falling on your side of the field',
            'All of the above',
          ],
          rightAnswer: 'All of the above',
          isPassed: false,
        ),
        Quiz(
          name: 'Volleyball',
          question:
              'What is the action called when a player sends the ball over the net to the opponent\'s side?',
          answers: ['Reception', 'Pass', 'Attack', 'Block'],
          rightAnswer: 'Attack',
          isPassed: false,
        ),
        Quiz(
          name: 'Volleyball',
          question: 'How many sets are usually played in a volleyball match?',
          answers: ['1', '2', '3', '5'],
          rightAnswer: '3',
          isPassed: false,
        ),
        Quiz(
          name: 'Volleyball',
          question: 'What action is prohibited by the rules of volleyball?',
          answers: [
            'More than three touches of the ball by one player',
            'Touching the net',
            'Passing the ball with your hands',
            'All of the above',
          ],
          rightAnswer: 'All of the above',
          isPassed: false,
        ),
      ],
      quizStatus: QuizStatus.notStarted,
      quizProgress: 0,
    ),
    SportCard(
      type: SportType.boxing,
      imagePath: 'assets/images/boxing.png',
      name: 'Boxing',
      lesson: Lesson(text: LessonsText.boxing, isPassed: false),
      quizzes: [
        Quiz(
          name: 'Boxing',
          question: 'Who is the current undefeated world champion in the heavyweight division?',
          answers: ['Anthony Joshua', 'Tyson Fury', 'Deontay Wilder', 'Andy Ruiz Jr.'],
          rightAnswer: 'Tyson Fury',
          isPassed: false,
        ),
        Quiz(
          name: 'Boxing',
          question: 'Which of the following boxing rules prohibits punches below the belt?',
          answers: [
            'Jumping on the opponent is prohibited',
            'Hitting the opponent in the back is prohibited',
            'Hitting the opponent in the back of the head is prohibited',
            'Hitting the opponent below the belt is prohibited',
          ],
          rightAnswer: 'Hitting the opponent below the belt is prohibited',
          isPassed: false,
        ),
        Quiz(
          name: 'Boxing',
          question:
              'Which of the following expressions describes the concept of "clinch" in boxing?',
          answers: [
            'A quick and powerful punch',
            'Holding the opponent by the hands or body',
            'Jumping forward to punch',
            'Quick sidestep to avoid a punch'
          ],
          rightAnswer: 'Holding the opponent by the hands or body',
          isPassed: false,
        ),
        Quiz(
          name: 'Boxing',
          question: 'Which boxer was known for his undefeated streak of 50 wins?',
          answers: ['Muhammad Ali', 'Mike Tyson', 'Floyd Mayweather Jr.', 'Sugar Ray Robinson'],
          rightAnswer: 'Sugar Ray Robinson',
          isPassed: false,
        ),
        Quiz(
          name: 'Boxing',
          question: 'Which of the following titles is the most prestigious in professional boxing?',
          answers: [
            'International championship',
            'Regional championship',
            'Intercontinental championship',
            'World championship'
          ],
          rightAnswer: 'World championship',
          isPassed: false,
        ),
      ],
      quizStatus: QuizStatus.notStarted,
      quizProgress: 0,
    ),
    SportCard(
      type: SportType.wrestling,
      imagePath: 'assets/images/wrestling.png',
      name: 'Wrestling',
      lesson: Lesson(text: LessonsText.wrestling, isPassed: false),
      quizzes: [
        Quiz(
          name: 'Wrestling',
          question: 'What is a key element in sports?',
          answers: ['Fairness', 'Wrestling', 'Respect for opponents', 'Training'],
          rightAnswer: 'Wrestling',
          isPassed: false,
        ),
        Quiz(
          name: 'Wrestling',
          question: 'What qualities are required for wrestling?',
          answers: [
            'Laziness and indifference',
            'Weakness and lack of persistence',
            'Strength, perseverance, and persistence',
            'Passivity and inaction'
          ],
          rightAnswer: 'Strength, perseverance, and persistence',
          isPassed: false,
        ),
        Quiz(
          name: 'Wrestling',
          question: 'What can we wrestle for besides winning in sports?',
          answers: [
            'Justice and rights',
            'Laziness and indifference',
            'Limitations and fears',
            'Passivity and inaction'
          ],
          rightAnswer: 'Justice and rights',
          isPassed: false,
        ),
        Quiz(
          name: 'Wrestling',
          question: 'What helps us develop and grow through wrestling?',
          answers: [
            'Lack of self-control',
            'Winning in every situation',
            'Self-knowledge and overcoming oneself',
            'Abandoning our values and priorities'
          ],
          rightAnswer: 'Self-knowledge and overcoming oneself',
          isPassed: false,
        ),
        Quiz(
          name: 'Wrestling',
          question: 'What does wrestling do to us?',
          answers: [
            'Weakens us',
            'Makes us vulnerable',
            'Makes us stronger and more resilient',
            'Helps us avoid difficulties'
          ],
          rightAnswer: 'Makes us stronger and more resilient',
          isPassed: false,
        ),
      ],
      quizStatus: QuizStatus.notStarted,
      quizProgress: 0,
    ),
    SportCard(
      type: SportType.swimming,
      imagePath: 'assets/images/swiming.png',
      name: 'Swimming',
      lesson: Lesson(text: LessonsText.swimming, isPassed: false),
      quizzes: [
        Quiz(
          name: 'Swimming',
          question: 'Which movement is the main one when swimming on the back?',
          answers: [
            'Forward movement of the arms and downward movement of the legs',
            'Forward movement of the arms and upward movement of the legs',
            'Downward movement of the arms and upward movement of the legs',
            'Downward movement of the arms and legs'
          ],
          rightAnswer: 'Forward movement of the arms and upward movement of the legs',
          isPassed: false,
        ),
        Quiz(
          name: 'Swimming',
          question: 'What advantage does swimming have over other types of physical activity?',
          answers: [
            'Strengthening the muscles of the upper body',
            'Improving coordination and balance',
            'Increasing flexibility',
            'Improving the cardiovascular system'
          ],
          rightAnswer: 'Improving the cardiovascular system',
          isPassed: false,
        ),
        Quiz(
          name: 'Swimming',
          question: 'What effect does swimming have on respiratory function?',
          answers: [
            'Reduces the capacity of the pulmonary system',
            'Worsens control over breathing',
            'Develops the lungs and increases the overall capacity of the pulmonary system',
            'Does not affect respiratory function'
          ],
          rightAnswer:
              'Develops the lungs and increases the overall capacity of the pulmonary system',
          isPassed: false,
        ),
        Quiz(
          name: 'Swimming',
          question: 'What advantage does swimming have for people with musculoskeletal problems?',
          answers: [
            'Increases pressure on the joints',
            'Worsens coordination and balance',
            'Reduces pressure on the joints',
            'Worsens the condition of the musculoskeletal system'
          ],
          rightAnswer: 'Reduces pressure on the joints',
          isPassed: false,
        ),
        Quiz(
          name: 'Swimming',
          question: 'What effect does swimming have on mental health?',
          answers: [
            'Increases stress and tension',
            'Worsens mood',
            'Relieves stress and tension',
            'Does not affect mental health'
          ],
          rightAnswer: 'Relieves stress and tension',
          isPassed: false,
        ),
      ],
      quizStatus: QuizStatus.notStarted,
      quizProgress: 0,
    ),
    SportCard(
      type: SportType.athletics,
      imagePath: 'assets/images/athletics.png',
      name: 'Athletics',
      lesson: Lesson(text: LessonsText.athletics, isPassed: false),
      quizzes: [
        Quiz(
          name: 'Athletics',
          question: 'What disciplines does athletics include?',
          answers: [
            'Swimming and gymnastics',
            'Running, jumping, and throwing',
            'Tennis and football',
            'Chess and boxing'
          ],
          rightAnswer: 'Running, jumping, and throwing',
          isPassed: false,
        ),
        Quiz(
          name: 'Athletics',
          question: 'What is required for athletics training?',
          answers: [
            'Special equipment and simulators',
            'Good sneakers and open space',
            'Bicycle and helmet',
            'Books and pens'
          ],
          rightAnswer: 'Good sneakers and open space',
          isPassed: false,
        ),
        Quiz(
          name: 'Athletics',
          question: 'What aspects of physical preparation does athletics develop?',
          answers: [
            'Only strength',
            'Only speed',
            'Cardiovascular system, muscles, flexibility, and endurance',
            'Only accuracy'
          ],
          rightAnswer: 'Cardiovascular system, muscles, flexibility, and endurance',
          isPassed: false,
        ),
        Quiz(
          name: 'Athletics',
          question: 'What personal qualities does athletics develop?',
          answers: [
            'Laziness and indifference',
            'Indecision and passivity',
            'Perseverance, willpower, and self-discipline',
            'Aggressiveness and selfishness'
          ],
          rightAnswer: 'Perseverance, willpower, and self-discipline',
          isPassed: false,
        ),
        Quiz(
          name: 'Athletics',
          question:
              'What promotes the development of friendship and respect for opponents in athletics?',
          answers: [
            'Sports competitions',
            'Computer games',
            'Competition and unfair play',
            'Lack of communication with other athletes'
          ],
          rightAnswer: 'Sports competitions',
          isPassed: false,
        ),
      ],
      quizStatus: QuizStatus.notStarted,
      quizProgress: 0,
    ),
    SportCard(
      type: SportType.gymnastics,
      imagePath: 'assets/images/gymnastics.png',
      name: 'Gymnastics',
      lesson: Lesson(text: LessonsText.gymnastics, isPassed: false),
      quizzes: [
        Quiz(
          name: 'Gymnastics',
          question: 'What results can be achieved thanks to gymnastics exercises?',
          answers: [
            'Improving muscle strength and endurance',
            'Developing intellect and erudition',
            'Improving voice and articulation',
            'Improving vision and hearing'
          ],
          rightAnswer: 'Improving muscle strength and endurance',
          isPassed: false,
        ),
        Quiz(
          name: 'Gymnastics',
          question:
              'What promotes the strengthening of the heart and vessels during gymnastics exercises?',
          answers: [
            'Intensive cardio loads',
            'Exercises for the arms and legs',
            'Stretching and flexibility',
            'Abdominal muscle exercises'
          ],
          rightAnswer: 'Intensive cardio loads',
          isPassed: false,
        ),
        Quiz(
          name: 'Gymnastics',
          question: 'What effect does gymnastics have on respiratory function?',
          answers: [
            'Improves heart function',
            'Increases overall body endurance',
            'Increases lung capacity',
            'Reduces pressure on joints'
          ],
          rightAnswer: 'Increases lung capacity',
          isPassed: false,
        ),
        Quiz(
          name: 'Gymnastics',
          question: 'Who is especially recommended to practice gymnastics?',
          answers: [
            'People with musculoskeletal problems',
            'People with vision problems',
            'People with hearing problems',
            'People with memory problems'
          ],
          rightAnswer: 'People with musculoskeletal problems',
          isPassed: false,
        ),
        Quiz(
          name: 'Gymnastics',
          question: 'What effect does gymnastics have on mental health?',
          answers: [
            'Reduces stress and tension',
            'Increases energy levels',
            'Improves mood',
            'All of the above'
          ],
          rightAnswer: 'All of the above',
          isPassed: false,
        ),
      ],
      quizStatus: QuizStatus.notStarted,
      quizProgress: 0,
    ),
    SportCard(
      type: SportType.figureSkating,
      imagePath: 'assets/images/figure_skating.png',
      name: 'Figure Skating',
      lesson: Lesson(text: LessonsText.figureSkating, isPassed: false),
      quizzes: [
        Quiz(
          name: 'Figure Skating',
          question: 'Which of the following elements is NOT a basic element of figure skating?',
          answers: ['Jumps', 'Spins', 'Steps', 'Hits'],
          rightAnswer: 'Hits',
          isPassed: false,
        ),
        Quiz(
          name: 'Figure Skating',
          question: 'What qualities are necessary for successful figure skating?',
          answers: [
            'Flexibility and plasticity',
            'Leg strength',
            'Good endurance',
            'All of the above'
          ],
          rightAnswer: 'All of the above',
          isPassed: false,
        ),
        Quiz(
          name: 'Figure Skating',
          question: 'What personal qualities does figure skating develop?',
          answers: [
            'Perseverance and focus',
            'Self-discipline and responsibility',
            'Friendship and respect',
            'All of the above'
          ],
          rightAnswer: 'All of the above',
          isPassed: false,
        ),
        Quiz(
          name: 'Figure Skating',
          question: 'What do figure skating competitions represent?',
          answers: [
            'Testing of athletes\' skills and abilities',
            'An opportunity to demonstrate their individuality and creative approach',
            'Development of friendship and respect for opponents',
            'All of the above'
          ],
          rightAnswer: 'All of the above',
          isPassed: false,
        ),
        Quiz(
          name: 'Figure Skating',
          question: 'What does figure skating represent?',
          answers: [
            'A sports discipline that combines grace, strength, and technicality',
            'An art on ice, requiring high physical preparation',
            'A magnificent art that captivates the audience with its beauty and elegance',
            'All of the above'
          ],
          rightAnswer: 'All of the above',
          isPassed: false,
        )
      ],
      quizStatus: QuizStatus.notStarted,
      quizProgress: 0,
    ),
    SportCard(
      type: SportType.skateboarding,
      imagePath: 'assets/images/skateboarding.png',
      name: 'Skateboarding',
      lesson: Lesson(text: LessonsText.skateboarding, isPassed: false),
      quizzes: [
        Quiz(
          name: 'Skateboarding',
          question: 'Which of the following elements is NOT a basic element of figure skating?',
          answers: ['Jumps', 'Spins', 'Steps', 'Hits'],
          rightAnswer: 'Hits',
          isPassed: false,
        ),
        Quiz(
          name: 'Skateboarding',
          question: 'What qualities are necessary for successful figure skating?',
          answers: [
            'Flexibility and plasticity',
            'Leg strength',
            'Good endurance',
            'All of the above'
          ],
          rightAnswer: 'All of the above',
          isPassed: false,
        ),
        Quiz(
          name: 'Skateboarding',
          question: 'What personal qualities does figure skating develop?',
          answers: [
            'Perseverance and focus',
            'Self-discipline and responsibility',
            'Friendship and respect',
            'All of the above'
          ],
          rightAnswer: 'All of the above',
          isPassed: false,
        ),
        Quiz(
          name: 'Skateboarding',
          question: 'What do figure skating competitions represent?',
          answers: [
            'Testing of athletes\' skills and abilities',
            'An opportunity to demonstrate their individuality and creative approach',
            'Development of friendship and respect for opponents',
            'All of the above'
          ],
          rightAnswer: 'All of the above',
          isPassed: false,
        ),
        Quiz(
          name: 'Skateboarding',
          question: 'What does figure skating represent?',
          answers: [
            'A sports discipline that combines grace, strength, and technicality',
            'An art on ice, requiring high physical preparation',
            'A magnificent art that captivates the audience with its beauty and elegance',
            'All of the above'
          ],
          rightAnswer: 'All of the above',
          isPassed: false,
        ),
      ],
      quizStatus: QuizStatus.notStarted,
      quizProgress: 0,
    ),
    SportCard(
      type: SportType.snowboarding,
      imagePath: 'assets/images/snowboarding.png',
      name: 'Snowboarding',
      lesson: Lesson(text: LessonsText.snowboarding, isPassed: false),
      quizzes: [
        Quiz(
          name: 'Snowboarding',
          question: 'What sport does snowboarding represent?',
          answers: ['Skiing', 'Surfing', 'Skateboarding', 'All of the above'],
          rightAnswer: 'All of the above',
          isPassed: false,
        ),
        Quiz(
          name: 'Snowboarding',
          question: 'Which muscles work actively during snowboarding?',
          answers: [
            'Arm and shoulder muscles',
            'Leg and buttock muscles',
            'Abdominal and back muscles',
            'Neck and back muscles'
          ],
          rightAnswer: 'Leg and buttock muscles',
          isPassed: false,
        ),
        Quiz(
          name: 'Snowboarding',
          question:
              'What advantage of snowboarding is associated with the development of coordination of movements?',
          answers: [
            'Improved physical fitness',
            'Development of balance and flexibility',
            'Strengthening the muscles of the legs and buttocks',
            'Development of mental well-being'
          ],
          rightAnswer: 'Development of balance and flexibility',
          isPassed: false,
        ),
        Quiz(
          name: 'Snowboarding',
          question: 'What positive effect on mental health does snowboarding have?',
          answers: [
            'Improved mood and reduced stress',
            'Strengthening muscles and increasing endurance',
            'Development of movement coordination',
            'Enjoyment of mountain nature'
          ],
          rightAnswer: 'Improved mood and reduced stress',
          isPassed: false,
        ),
        Quiz(
          name: 'Snowboarding',
          question:
              'What advantage of snowboarding is associated with the opportunity to experience the sensation of speed and wind?',
          answers: [
            'Development of physical fitness',
            'Strengthening the muscles of the legs and buttocks',
            'Improved mood and reduced stress',
            'Feeling of freedom and adventures'
          ],
          rightAnswer: 'Feeling of freedom and adventures',
          isPassed: false,
        )
      ],
      quizStatus: QuizStatus.notStarted,
      quizProgress: 0,
    ),
    SportCard(
      type: SportType.climbing,
      imagePath: 'assets/images/rock_climbing.png',
      name: 'Rock Climbing',
      lesson: Lesson(text: LessonsText.rockClimbing, isPassed: false),
      quizzes: [
        Quiz(
          name: 'Rock Climbing',
          question: 'What skills are needed to do rock climbing?',
          answers: [
            'Courage and agility',
            'Readiness for risk and a desire for adventures',
            'Physical endurance and flexibility',
            'All of the above'
          ],
          rightAnswer: 'All of the above',
          isPassed: false,
        ),
        Quiz(
          name: 'Rock Climbing',
          question: 'What can you see during rock climbing?',
          answers: [
            'Stunning landscapes and natural wonders',
            'Cities and architectural landmarks',
            'Shops and shopping malls',
            'Nothing, because rock climbing takes place indoors'
          ],
          rightAnswer: 'Stunning landscapes and natural wonders',
          isPassed: false,
        ),
        Quiz(
          name: 'Rock Climbing',
          question: 'Which muscles are especially actively involved in rock climbing?',
          answers: [
            'Arms, legs, and torso',
            'Neck and shoulders',
            'Thighs and buttocks',
            'Abdomen and back'
          ],
          rightAnswer: 'Arms, legs, and torso',
          isPassed: false,
        ),
        Quiz(
          name: 'Rock Climbing',
          question: 'What do you need to know for safe rock climbing?',
          answers: [
            'Rope work technique',
            'Use of special equipment',
            'Safety rules',
            'All of the above'
          ],
          rightAnswer: 'All of the above',
          isPassed: false,
        ),
        Quiz(
          name: 'Rock Climbing',
          question: 'What is recommended to do before starting rock climbing?',
          answers: [
            'Get training from experienced instructors',
            'Study all rules and safety techniques',
            'Follow all recommendations and instructions from instructors',
            'All of the above'
          ],
          rightAnswer: 'All of the above',
          isPassed: false,
        ),
      ],
      quizStatus: QuizStatus.notStarted,
      quizProgress: 0,
    ),
    SportCard(
      type: SportType.cycling,
      imagePath: 'assets/images/сycling.png',
      name: 'Cycling',
      lesson: Lesson(text: LessonsText.cycling, isPassed: false),
      quizzes: [
        Quiz(
          name: 'Cycling',
          question: 'Which muscles are actively involved when cycling?',
          answers: [
            'Arm and shoulder muscles',
            'Abdominal and back muscles',
            'Leg and buttock muscles',
            'Neck and chest muscles'
          ],
          rightAnswer: 'Leg and buttock muscles',
          isPassed: false,
        ),
        Quiz(
          name: 'Cycling',
          question: 'What effect does cycling have on the cardiovascular system?',
          answers: [
            'Deteriorates heart function',
            'Improves blood circulation',
            'Increases blood pressure',
            'Reduces oxygen level in the blood'
          ],
          rightAnswer: 'Improves blood circulation',
          isPassed: false,
        ),
        Quiz(
          name: 'Cycling',
          question: 'What makes cycling a great way to maintain a healthy weight?',
          answers: [
            'Increases appetite',
            'Speeds up metabolism',
            'Reduces body\'s energy expenditure',
            'Increases fat deposits'
          ],
          rightAnswer: 'Speeds up metabolism',
          isPassed: false,
        ),
        Quiz(
          name: 'Cycling',
          question: 'What skills are developed when cycling?',
          answers: [
            'Attention and concentration',
            'Musical ear and rhythm',
            'Artistic perception and creative thinking',
            'Mathematical calculations and analytical thinking'
          ],
          rightAnswer: 'Attention and concentration',
          isPassed: false,
        ),
        Quiz(
          name: 'Cycling',
          question: 'What opportunity does cycling provide for social interaction?',
          answers: [
            'Opportunity to communicate with animals',
            'Opportunity to travel around the world',
            'Opportunity to meet like-minded people',
            'Opportunity to become a famous athlete'
          ],
          rightAnswer: 'Opportunity to meet like-minded people',
          isPassed: false,
        ),
      ],
      quizStatus: QuizStatus.notStarted,
      quizProgress: 0,
    ),
    SportCard(
      type: SportType.badminton,
      imagePath: 'assets/images/badminton.png',
      name: 'Badminton',
      lesson: Lesson(text: LessonsText.badminton, isPassed: false),
      quizzes: [
        Quiz(
          name: 'Badminton',
          question: 'What sports instrument is used in a game of badminton?',
          answers: ['Football', 'Basketball', 'Racket', 'Tennis racket'],
          rightAnswer: 'Racket',
          isPassed: false,
        ),
        Quiz(
          name: 'Badminton',
          question: 'What ball is used in a game of badminton?',
          answers: ['Football', 'Basketball', 'Tennis ball', 'Feather ball'],
          rightAnswer: 'Feather ball',
          isPassed: false,
        ),
        Quiz(
          name: 'Badminton',
          question: 'What muscles are especially developed when playing badminton?',
          answers: ['Arm muscles', 'Back muscles', 'Leg and buttock muscles', 'Abdominal muscles'],
          rightAnswer: 'Leg and buttock muscles',
          isPassed: false,
        ),
        Quiz(
          name: 'Badminton',
          question: 'What helps improve game concentration and reaction when playing badminton?',
          answers: [
            'Warm-up before the game',
            'Proper nutrition',
            'Arm muscle training',
            'Quick reaction to ball movement'
          ],
          rightAnswer: 'Quick reaction to ball movement',
          isPassed: false,
        ),
        Quiz(
          name: 'Badminton',
          question: 'What is one of the advantages of badminton for physical and mental health?',
          answers: [
            'Improving coordination and balance',
            'Development of creative thinking',
            'Strengthening of back muscles',
            'Increasing hand flexibility'
          ],
          rightAnswer: 'Improving coordination and balance',
          isPassed: false,
        ),
      ],
      quizStatus: QuizStatus.notStarted,
      quizProgress: 0,
    ),
    SportCard(
      type: SportType.rugby,
      imagePath: 'assets/images/rugby.png',
      name: 'Rugby',
      lesson: Lesson(text: LessonsText.rugby, isPassed: false),
      quizzes: [
        Quiz(
          name: 'Rugby',
          question: 'Which team won the first Rugby World Championship in 1987?',
          answers: ['Australia', 'New Zealand', 'England', 'South Africa'],
          rightAnswer: 'New Zealand',
          isPassed: false,
        ),
        Quiz(
          name: 'Rugby',
          question: 'How many players make up a full rugby team?',
          answers: ['11', '13', '15', '17'],
          rightAnswer: '15',
          isPassed: false,
        ),
        Quiz(
          name: 'Rugby',
          question: 'What is the main playing field for rugby called?',
          answers: ['Court', 'Playground', 'Field', 'Stadium'],
          rightAnswer: 'Field',
          isPassed: false,
        ),
        Quiz(
          name: 'Rugby',
          question: 'Which team won the latest Rugby World Championship in 2019?',
          answers: ['Australia', 'New Zealand', 'England', 'South Africa'],
          rightAnswer: 'South Africa',
          isPassed: false,
        ),
        Quiz(
          name: 'Rugby',
          question: 'What action is considered a foul in rugby?',
          answers: [
            'Forward pass',
            'Throwing the ball forward',
            'Headshot',
            'Intercepting the ball'
          ],
          rightAnswer: 'Throwing the ball forward',
          isPassed: false,
        ),
      ],
      quizStatus: QuizStatus.notStarted,
      quizProgress: 0,
    ),
    SportCard(
      type: SportType.powerlifting,
      imagePath: 'assets/images/powerlifting.png',
      name: 'Powerlifting',
      lesson: Lesson(text: LessonsText.powerlifting, isPassed: false),
      quizzes: [
        Quiz(
          name: 'Powerlifting',
          question: 'Which discipline is not a part of powerlifting?',
          answers: ['Squats', 'Bench press', 'Deadlift', 'Long-distance running'],
          rightAnswer: 'Long-distance running',
          isPassed: false,
        ),
        Quiz(
          name: 'Powerlifting',
          question:
              'How many attempts are given to an athlete for each discipline in powerlifting?',
          answers: ['1', '2', '3', 'Unlimited'],
          rightAnswer: '3',
          isPassed: false,
        ),
        Quiz(
          name: 'Powerlifting',
          question: 'Which team won the latest Powerlifting World Championship?',
          answers: ['Russia', 'USA', 'Ukraine', 'China'],
          rightAnswer: 'Russia',
          isPassed: false,
        ),
        Quiz(
          name: 'Powerlifting',
          question: 'Which of these muscles is key to performing a bench press in powerlifting?',
          answers: ['Biceps', 'Pectoral muscles', 'Quadriceps', 'Obliques'],
          rightAnswer: 'Pectoral muscles',
          isPassed: false,
        ),
        Quiz(
          name: 'Powerlifting',
          question:
              'Which of these items is used to set the barbell when performing squats in powerlifting?',
          answers: ['Dumbbell', 'Barbell', 'Trampoline', 'Jump rope'],
          rightAnswer: 'Barbell',
          isPassed: false,
        ),
      ],
      quizStatus: QuizStatus.notStarted,
      quizProgress: 0,
    ),
  ];

  static List<News> getNews = [
    News(
      title: 'Brazil and France met in the',
      text:
          'Brazil and France met in the final of the FIFA World Cup. The Brazilians won 3:1 and became world champions.',
      imagePath: 'assets/images/news_football.jpg',
      iconPath: 'assets/images/icon_football.png',
      stringDateTime: 'January 5, 2022',
    ),
    News(
      title: 'Russian figure skater Yevgeny Medvedeva',
      text: 'won the gold medal at the World Figure Skating Championships in Stockholm, Sweden.',
      imagePath: 'assets/images/news_figure.jpg',
      iconPath: 'assets/images/icon_figure.png',
      stringDateTime: 'February 12, 2022',
    ),
    News(
      title: 'A serious accident occurred in a Formula 1',
      text: 'race in Australia, leaving several drivers injured. The race was canceled.',
      imagePath: 'assets/images/news_race.jpg',
      iconPath: 'assets/images/icon_race.png',
      stringDateTime: 'March 20, 2022',
    ),
    News(
      title: 'Track and field athlete Shelly-Ann Fraser-Price of Jamaica',
      text: 'set a new world record in the 100 meters, covering the distance in 9.58 seconds.',
      imagePath: 'assets/images/news_athletics.jpg',
      iconPath: 'assets/images/icon_athletics.png',
      stringDateTime: 'April 2, 2022',
    ),
    News(
      title: 'The Russian ice hockey team',
      text: 'won the gold medal at the Tokyo Olympics, beating Canada 4-3 in the final.',
      imagePath: 'assets/images/news_hockey.jpg',
      iconPath: 'assets/images/icon_hockey.png',
      stringDateTime: 'May 10, 2022',
    ),
    News(
      title: 'Boxer Antonio Garcia of Mexico',
      text: 'defeated Manny Pacquiao of the Philippines in a world welterweight title fight.',
      imagePath: 'assets/images/news_box.jpg',
      iconPath: 'assets/images/icon_box.png',
      stringDateTime: 'June 18, 2022',
    ),
    News(
      title: 'Tennis player Naomi Osaka announced',
      text: 'her retirement from professional tennis due to health issues.',
      imagePath: 'assets/images/news_tennis.jpg',
      iconPath: 'assets/images/icon_tennis.png',
      stringDateTime: 'July 25, 2022',
    ),
    News(
      title: 'Manchester City and PSG',
      text: 'met in the UEFA Champions League final. Manchester City won 2-0 and became champions.',
      imagePath: 'assets/images/news_football.jpg',
      iconPath: 'assets/images/icon_football.png',
      stringDateTime: 'August 3, 2022',
    ),
    News(
      title: 'The Tampa Bay Buccaneers defeated',
      text: 'the Dallas Cowboys 31-29 in the opening game of the new National Football League (NFL) season.',
      imagePath: 'assets/images/news_football.jpg',
      iconPath: 'assets/images/icon_football.png',
      stringDateTime: 'September 12, 2022',
    ),
    News(
      title: 'Basketball player LeBron James',
      text: 'has moved from the Los Angeles Lakers to the New York Knicks.',
      imagePath: 'assets/images/news_basketball.jpg',
      iconPath: 'assets/images/icon_basketball.png',
      stringDateTime: 'October 20, 2022',
    ),
    News(
      title: 'England and South Africa met',
      text: 'in the final of the Rugby World Cup. South Africa won with a score of 32:12 and became the world champion.',
      imagePath: 'assets/images/news_baseball.jpg',
      iconPath: 'assets/images/icon_ragby.png',
      stringDateTime: 'November 5, 2022',
    ),
    News(
      title: 'Russian figure skater Alina Zagitova',
      text: 'announced her return to professional competitions after a pause in her career.',
      imagePath: 'assets/images/news_figure.jpg',
      iconPath: 'assets/images/icon_figure.png',
      stringDateTime: 'December 15, 2022',
    ),
    News(
      title: 'The Golden State Warriors',
      text: 'defeated the Los Angeles Lakers 112-105 in an National Basketball Association (NBA) game.',
      imagePath: 'assets/images/news_basketball.jpg',
      iconPath: 'assets/images/icon_basketball.png',
      stringDateTime: 'January 3, 2023',
    ),
    News(
      title: 'There was a collision between',
      text: 'Lewis Hamilton and Max Verstappen in the Formula 1 race in Monaco. Both drivers were injured and hospitalized.',
      imagePath: 'assets/images/news_race.jpg',
      iconPath: 'assets/images/icon_race.png',
      stringDateTime: 'February 10, 2023',
    ),
    News(
      title: 'Russian gymnast Aliya Mustafina',
      text: 'won the gold medal at the World Artistic Gymnastics Championships in Budapest, Hungary.',
      imagePath: 'assets/images/news_athletics.jpg',
      iconPath: 'assets/images/icon_athletics.png',
      stringDateTime: 'March 18, 2023',
    ),
    News(
      title: 'Germany and Argentina met in the final',
      text: 'of the Confederations Cup. Germany won 2:1 and became the tournament champion.',
      imagePath: 'assets/images/news_football.jpg',
      iconPath: 'assets/images/icon_football.png',
      stringDateTime: 'April 25, 2023',
    ),
    News(
      title: 'Tennis player Serena Williams announced',
      text: 'the end of her professional career after her last match at a tournament in Miami.',
      imagePath: 'assets/images/news_tennis.jpg',
      iconPath: 'assets/images/icon_tennis.png',
      stringDateTime: 'May 5, 2023',
    ),
    News(
      title: 'Boxer Tyson Fury of Great Britain',
      text: 'defeated Anthony Joshua of Great Britain in a world heavyweight title fight.',
      imagePath: 'assets/images/news_box.jpg',
      iconPath: 'assets/images/icon_box.png',
      stringDateTime: 'June 15, 2023',
    ),
    News(
      title: 'The Tampa Bay Lightning defeated',
      text: 'the Toronto Maple Leafs 4-2 in the opening game of the new National Hockey League (NHL) season.',
      imagePath: 'assets/images/news_hockey.jpg',
      iconPath: 'assets/images/icon_hockey.png',
      stringDateTime: 'September 20, 2023',
    ),
    News(
      title: 'Basketball player Diana Taurus',
      text: 'has transferred from the Chicago Sky to the Los Angeles Sparks.',
      imagePath: 'assets/images/news_basketball.jpg',
      iconPath: 'assets/images/icon_basketball.png',
      stringDateTime: 'October 10, 2023',
    ),
  ];
}
