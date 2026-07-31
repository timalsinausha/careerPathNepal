import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../careers/services/recommendation_api_services.dart';
import '../models/complete_assessment_response.dart';
import '../provider/assessment_provider.dart';


class AssessmentResultScreen extends StatefulWidget {

  final CompleteAssessmentResponse response;

  const AssessmentResultScreen({
    super.key,
    required this.response,
  });

  @override
  State<AssessmentResultScreen> createState() => _AssessmentResultScreenState();
}

class _AssessmentResultScreenState extends State<AssessmentResultScreen> {
  @override
void initState() {
  super.initState();
  loadResult();
}
void loadResult() async {

  final provider = context.read<AssessmentProvider>();

  final response =
      await provider.getAssessmentResult(7);

  print(response.attemptId);
}

List<AssessmentResult> getTopStrengths() {

  final List<AssessmentResult> allResults = [];

  widget.response.results.values.forEach((list) {
    allResults.addAll(list);
  });

  allResults.sort(
    (a, b) => b.percentage.compareTo(a.percentage),
  );

  return allResults.take(3).toList();
}

double getOverallPercentage() {

    final List<AssessmentResult> allResults = [];

    widget.response.results.values.forEach((list) {
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
final topStrengths = getTopStrengths();
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

const SizedBox(height: 30),

          const SizedBox(height: 20),

          ResultSection(
            title: "Interest",
            results:
                widget.response.results["interest"] ?? [],
          ),

          ResultSection(
            title: "Traits",
            results:
                widget.response.results["trait"] ?? [],
          ),

          ResultSection(
            title: "Work Style",
            results:
                widget.response.results["work_style"] ?? [],
          ),

          ResultSection(
            title: "Values",
            results:
                widget.response.results["value"] ?? [],
          ),

          ResultSection(
            title: "Aptitude",
            results:
                widget.response.results["aptitude"] ?? [],
          ),

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