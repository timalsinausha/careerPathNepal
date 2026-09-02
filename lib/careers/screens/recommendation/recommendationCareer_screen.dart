import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/recommendation_provider.dart';
import '../career_details_screen.dart';

class RecommendedCareersScreen extends StatelessWidget {
  const RecommendedCareersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        context.watch<RecommendationProvider>();

    final recommendations =
        provider.recommendations;

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(
        title: const Text(
          "Recommended Careers",
        ),
      ),

      body: provider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )

          : recommendations.isEmpty
              ? const Center(
                  child: Text(
                    "No career recommendations available.",
                  ),
                )

              : ListView.builder(
                  padding:
                      const EdgeInsets.all(16),

                  itemCount:
                      recommendations.length,

                  itemBuilder:
                      (context, index) {

                    final recommendation =
                        recommendations[index];

                    final career =
                        recommendation.career;

                    return Card(
                      margin:
                          const EdgeInsets.only(
                        bottom: 10,
                      ),

                      elevation: 0,

                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                          14,
                        ),
                      ),

                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),

                        // =================================================
                        // ICON
                        // =================================================

                        leading: Container(
                          padding:
                              const EdgeInsets.all(
                            10,
                          ),

                          decoration:
                              BoxDecoration(
                            color:
                                const Color(
                              0xffEEF2FF,
                            ),

                            borderRadius:
                                BorderRadius.circular(
                              12,
                            ),
                          ),

                          child: const Icon(
                            Icons.work_outline,
                            color:
                                Color(0xff274CFF),
                          ),
                        ),

                        // =================================================
                        // CAREER NAME
                        // =================================================

                        title: Text(
                          career.name,

                          style:
                              const TextStyle(
                            fontWeight:
                                FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        // =================================================
                        // MATCH SCORE
                        // =================================================

                        subtitle: Padding(
                          padding:
                              const EdgeInsets.only(
                            top: 5,
                          ),

                          child: Text(
                            "${recommendation.displayMatchScore.toStringAsFixed(0)}% Match",
                          ),
                        ),

                        // =================================================
                        // ARROW
                        // =================================================

                        trailing:
                            const Icon(
                          Icons
                              .arrow_forward_ios,
                          size: 16,
                        ),

                        // =================================================
                        // CAREER DETAIL
                        // =================================================

                        onTap: () {

                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder: (_) =>
                                  CareerDetailScreen(
                                slug: career.slug,

                                matchScore:
                                    recommendation
                                        .displayMatchScore,
                              ),
                            ),
                          );

                        },
                      ),
                    );
                  },
                ),
    );
  }
}