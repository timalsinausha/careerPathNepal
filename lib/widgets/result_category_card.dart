import 'package:flutter/material.dart';

import '../assessment/models/assessment_result_response.dart';
import 'result_progress_tile.dart';

class ResultCategoryCard extends StatelessWidget {
  final String title;

  final List<AssessmentResult> results;

  const ResultCategoryCard({
    super.key,
    required this.title,
    required this.results,
  });

  @override
  Widget build(BuildContext context) {

    if (results.isEmpty) {
      return const SizedBox();
    }

    return Card(

      margin: const EdgeInsets.only(
        bottom: 22,
      ),

      elevation: 2,

      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18),
      ),

      child: Padding(

        padding:
            const EdgeInsets.all(18),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Text(

              title,

              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff0F62BC),
              ),

            ),

            const SizedBox(height: 18),

            ...results.map(

              (result) => ResultProgressTile(

                attribute:
                    result.attribute,

                percentage:
                    result.percentage,

              ),

            ),

          ],

        ),

      ),

    );

  }
}