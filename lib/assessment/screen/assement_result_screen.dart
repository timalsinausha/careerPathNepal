import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../careers/providers/recommendation_provider.dart';
import '../../careers/screens/career_details_screen.dart';
import '../models/assessment_result_response.dart';
import '../provider/assessment_provider.dart';
import 'assement_intro_screen.dart';


class AssessmentResultScreen extends StatefulWidget {

  final AssessmentResultResponse? response;

  const AssessmentResultScreen({
    super.key,
     this.response,
  });

  @override
  State<AssessmentResultScreen> createState() => _AssessmentResultScreenState();
}

class _AssessmentResultScreenState extends State<AssessmentResultScreen> {
@override
void initState() {
  super.initState();

  WidgetsBinding.instance.addPostFrameCallback((_) async {
    if (!mounted) return;

    final assessmentProvider =
        context.read<AssessmentProvider>();

    await assessmentProvider.getAssessmentStatus();

    if (!mounted) return;

    final status = assessmentProvider.assessmentStatus;

    if (status == null) {
      setState(() {
        isLoading = false;
      });
      return;
    }

    if (!status.hasAttempt) {
      setState(() {
        isLoading = false;
      });
      return;
    }

    if (!status.isCompleted) {
      setState(() {
        isLoading = false;
      });
      return;
    }

    // Assessment completed
    if (widget.response != null) {
      result = widget.response;

      setState(() {
        isLoading = false;
      });

      await context
          .read<RecommendationProvider>()
          .loadRecommendations();
    } else {
      await loadLatestResult();
    }
  });
}
AssessmentResultResponse? result;

bool isLoading = true;

Future<void> loadLatestResult() async {
  final assessmentProvider =
      context.read<AssessmentProvider>();

  final recommendationProvider =
      context.read<RecommendationProvider>();

  final latestResult =
      await assessmentProvider.getAssessmentResult();

  if (!mounted) return;

  setState(() {
    result = latestResult;
    isLoading = false;
  });
  

  await recommendationProvider.loadRecommendations();
}

List<AssessmentResult> getTopStrengths() {

  final List<AssessmentResult> allResults = [];

  result!.results!.values.forEach((list) {
    allResults.addAll(list);
  });

  allResults.sort(
    (a, b) => b.percentage.compareTo(a.percentage),
  );

  return allResults.take(3).toList();
}

double getOverallPercentage() {

    final List<AssessmentResult> allResults = [];

    result!.results!.values.forEach((list) {
      allResults.addAll(list);
    });

    if (allResults.isEmpty) {
      return 0;
    }

    final total = allResults.fold<double>(
      0,
      (sum, item) => sum + item.percentage,
    );

    return total / allResults.length;

    
  }


@override
Widget build(BuildContext context) {
    final assessmentProvider =
    context.watch<AssessmentProvider>();

  if (assessmentProvider.isCheckingStatus) {
  return const Scaffold(
    body: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

  
final status = assessmentProvider.assessmentStatus;
if (status != null && !status.hasAttempt) {
return Scaffold(
backgroundColor: const Color(0xffF5F7FB),
appBar: AppBar(
title: const Text(
"Assessment Result"
),
),
        body: Center(
            child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
            Icon(
            Icons.assignment_outlined,
            size: 90,
            color: Colors.blueGrey,
            ),
            const SizedBox(height:20),
            const Text(
                "You haven't taken the assessment yet",
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize:22,
                fontWeight: FontWeight.bold,
            ),
            ),
            const SizedBox(height:12),
            const Text(
            "Complete your career assessment to discover your strengths and recommended career paths.",
            textAlign: TextAlign.center,
            style: TextStyle(
            fontSize:16,
            color: Colors.grey,
            ),
            ),
            const SizedBox(height:30),

            ElevatedButton(
            onPressed: (){

                                                 Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => const AssessmentIntroScreen(),
  ),
);

            },
            child: const Text(
            "Take Assessment"
            ),
            )
   ],
  ),
  ),
  ),
 );
}
if (status != null &&
    status.hasAttempt &&
    !status.isCompleted) {
  return Scaffold(
    appBar: AppBar(
      title: const Text(
          "Assessment Result"),
    ),
    body: Center(
      child: Padding(
        padding:
            const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Icon(
              Icons.pending_actions,
              size: 90,
              color: Colors.orange,
            ),
            const SizedBox(height: 20),
            const Text(
              "Assessment In Progress",
              style: TextStyle(
                fontSize: 22,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "You have an unfinished assessment. Continue where you left off.",
              textAlign:
                  TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {

                                        Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => const AssessmentIntroScreen(),
  ),
);

              },

              child: const Text(
                  "Continue Assessment"),
            )
          ],
        ),
      ),
    ),
  );
}
final topStrengths = getTopStrengths();
final recommendationProvider =
    context.watch<RecommendationProvider>();
  return Scaffold(
 backgroundColor: const Color(0xffF5F7FB),
    appBar: AppBar(
      title: const Text("Assessment Result"),
    ),

    body: SingleChildScrollView(

      child: Column(

        children: [
            Container(

            width: double.infinity,

            padding: const EdgeInsets.only(
              top: 30,
              bottom: 35,
            ),

            decoration: const BoxDecoration(

              gradient: LinearGradient(

                colors: [
                  Color(0xff2DB3DB),
                  Color(0xff0F62BC),
                ],

              ),

              borderRadius: BorderRadius.only(

                bottomLeft: Radius.circular(35),

                bottomRight: Radius.circular(35),

              ),

            ),

            child: const Column(

              children: [

                Icon(

                  Icons.emoji_events,

                  color: Colors.white,

                  size: 60,

                ),

                SizedBox(height: 15),

                Text(

                  "Assessment Completed",

                  style: TextStyle(

                    color: Colors.white,

                    fontWeight: FontWeight.bold,

                    fontSize: 26,

                  ),

                ),

                SizedBox(height: 10),

                Text(

                  "Great job! Your career profile is ready.",

                  style: TextStyle(

                    color: Colors.white70,

                    fontSize: 15,

                  ),

                ),

              ],

            ),

          ),
          const SizedBox(height: 20),

         
          Center(

  child: Column(

    children: [

      SizedBox(

        width: 100,

        height: 100,

        child: Stack(

          alignment: Alignment.center,

          children: [
            SizedBox(
              width: 90,
              height: 90,
              child: CircularProgressIndicator(
                strokeWidth: 7,
                value:  getOverallPercentage()/100,

              ),

            ),

            Column(

              mainAxisAlignment:
              MainAxisAlignment.center,

              children: [

                Text(

                   "${getOverallPercentage().toStringAsFixed(0)}%",

                  style: const TextStyle(

                    fontSize: 28,

                    fontWeight: FontWeight.bold,

                  ),

                ),

                const Text(

                  "Overall",

                )

              ],

            )

          ],

        ),

      ),

    ],

  ),

),
 const Text(

            "🏆 Top Strengths",

            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),

          ),

          const SizedBox(height: 16),

          StrengthCard(
            medal: "🥇",
            result: topStrengths[0],
          ),

          StrengthCard(
            medal: "🥈",
            result: topStrengths[1],
          ),

          StrengthCard(
            medal: "🥉",
            result: topStrengths[2],
          ),
const SizedBox(height: 24),

const Padding(
  padding: EdgeInsets.symmetric(horizontal: 16),
  child: Align(
    alignment: Alignment.centerLeft,
    child: Text(
      "Recommended Careers",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),

const SizedBox(height: 12),

if (recommendationProvider.isLoading)
  const Center(
    child: CircularProgressIndicator(),
  )
else if (recommendationProvider.recommendations.isEmpty)
  const Padding(
    padding: EdgeInsets.all(16),
    child: Text("No career recommendations available."),
  )
else
  ...recommendationProvider.recommendations
      .take(5)
      .map(
        (career) => Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: ListTile(
            title: Text(career.career.name),
            subtitle: Text(
              "${career.displayMatchScore.toStringAsFixed(0)}% Match",
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
                                            Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) =>  CareerDetailScreen(
  slug: career.career.slug,
  matchScore: career.displayMatchScore,
)
  ),
);     
            },
          ),
        ),
      ),

          // ResultSection(
          //   title: "Interest",
          //   results:
          //       result!.results!["interest"] ?? [],
          // ),

          // ResultSection(
          //   title: "Traits",
          //   results:
          //       result!.results!["trait"] ?? [],
          // ),

          // ResultSection(
          //   title: "Work Style",
          //   results:
          //       result!.results!["work_style"] ?? [],
          // ),

          // ResultSection(
          //   title: "Values",
          //   results:
          //       result!.results!["value"] ?? [],
          // ),

          // ResultSection(
          //   title: "Aptitude",
          //   results:
          //       result!.results!["aptitude"] ?? [],
          // ),

          const SizedBox(height: 30),

        ],

      ),

    ),

  );

}
}


class ResultSection extends StatelessWidget {
  final String title;
  final List<AssessmentResult> results;

  const ResultSection({
    super.key,
    required this.title,
    required this.results,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            ...results.map(

              (result) => Padding(

                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                ),

                child: Row(

                  children: [

                    Expanded(
                      child: Text(result.attribute),
                    ),

                    Text(
                      "${result.percentage.toStringAsFixed(1)}%",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],

                ),

              ),

            ),

          ],

        ),

      ),

    );

  }

}

class StrengthCard extends StatelessWidget {

  final String medal;

  final AssessmentResult result;

  const StrengthCard({
    super.key,
    required this.medal,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      elevation: 2,

      margin: const EdgeInsets.symmetric(vertical: 8),

      child: ListTile(

        leading: Text(
          medal,
          style: const TextStyle(fontSize: 28),
        ),

        title: Text(
          result.attribute,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Padding(

          padding: const EdgeInsets.only(top: 8),

          child: LinearProgressIndicator(

            value: result.percentage / 100,

            minHeight: 8,

            borderRadius: BorderRadius.circular(10),

          ),

        ),

        trailing: Text(

          "${result.percentage.toStringAsFixed(0)}%",

          style: const TextStyle(

            fontWeight: FontWeight.bold,

            fontSize: 16,

          ),

        ),

      ),

    );

  }

}