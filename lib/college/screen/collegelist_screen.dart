import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/college_provider.dart';
import 'college_details_screen.dart';

class CollegeScreen extends StatefulWidget {
  const CollegeScreen({super.key});

  @override
  State<CollegeScreen> createState() => _CollegeScreenState();
}

class _CollegeScreenState extends State<CollegeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CollegeProvider>().loadColleges();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Colleges'),
        centerTitle: true,
      ),

      body: Consumer<CollegeProvider>(
        builder: (context, provider, child) {

          // Loading
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Error
          if (provider.error != null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 50,
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Unable to load colleges',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      provider.error!,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: provider.loadColleges,
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              ),
            );
          }

          // Empty
          if (provider.colleges.isEmpty) {
            return const Center(
              child: Text(
                'No colleges available.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            );
          }

          // College list
          return RefreshIndicator(
            onRefresh: provider.loadColleges,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: provider.colleges.length,

              itemBuilder: (context, index) {
                final college = provider.colleges[index];

                return _CollegeCard(
                  name: college.name,

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CollegeDetailScreen(
                          slug: college.slug,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _CollegeCard extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const _CollegeCard({
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),

      elevation: 2,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),

      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),

        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),

          child: Row(
            children: [

              // College icon
              Container(
                width: 48,
                height: 48,

                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer,

                  borderRadius:
                      BorderRadius.circular(12),
                ),

                child: Icon(
                  Icons.account_balance_outlined,
                  color: Theme.of(context)
                      .colorScheme
                      .primary,
                ),
              ),

              const SizedBox(width: 16),

              // College name
              Expanded(
                child: Text(
                  name,

                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}