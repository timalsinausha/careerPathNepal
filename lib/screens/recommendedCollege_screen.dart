import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../careers/providers/recommendation_provider.dart';
import '../college/screen/college_details_screen.dart';


class RecommendedCollegesScreen
    extends StatelessWidget {
  const RecommendedCollegesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        context.watch<RecommendationProvider>();

    final colleges =
        _getColleges(provider);

    return Scaffold(
      backgroundColor:
          const Color(0xffF5F7FB),

      appBar: AppBar(
        title: const Text(
          "Recommended Colleges",
        ),
      ),

      body: provider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : colleges.isEmpty
              ? const Center(
                  child: Text(
                    "No recommended colleges available.",
                  ),
                )
              : ListView.builder(
                  padding:
                      const EdgeInsets.all(16),

                  itemCount: colleges.length,

                  itemBuilder:
                      (context, index) {
                    final college =
                        colleges[index];

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
                            Icons
                                .school_outlined,
                            color:
                                Color(0xff274CFF),
                          ),
                        ),

                        title: Text(
                          college.name,
                          style:
                              const TextStyle(
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        subtitle: Text(
                          "${college.district}, "
                          "${college.province}",
                        ),

                        trailing:
                            const Icon(
                          Icons
                              .arrow_forward_ios,
                          size: 16,
                        ),

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  CollegeDetailScreen(
                                slug:
                                    college.slug,
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

  List<dynamic> _getColleges(
    RecommendationProvider provider,
  ) {
    final colleges = <dynamic>[];

    for (final recommendation
        in provider.recommendations) {
      for (final college
          in recommendation.topColleges) {
        final exists = colleges.any(
          (item) => item.id == college.id,
        );

        if (!exists) {
          colleges.add(college);
        }
      }
    }

    return colleges;
  }
}