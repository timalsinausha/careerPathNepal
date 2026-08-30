import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(
        title: const Text(
          "Privacy Policy",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            20,
            20,
            20,
            35,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Header
              Center(
                child: Container(
                  height: 85,
                  width: 85,
                  decoration: BoxDecoration(
                    color: const Color(0xffEAF2FF),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Icon(
                    Icons.privacy_tip_outlined,
                    size: 48,
                    color: Color(0xff0F62BC),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Center(
                child: Text(
                  "Your Privacy Matters",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "CareerNepal respects your privacy and is committed "
                "to protecting your personal information. This Privacy "
                "Policy explains what information we collect, how we "
                "use it, and how we protect your information when you "
                "use the CareerNepal application.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 25),

              _PrivacySection(
                number: "1",
                title: "Information We Collect",
                content:
                    "When you create an account or use CareerNepal, "
                    "we may collect information that you voluntarily "
                    "provide, such as your name, email address, contact "
                    "number, educational information, location details, "
                    "and other information required to provide our services.",
              ),

              _PrivacySection(
                number: "2",
                title: "Assessment Information",
                content:
                    "CareerNepal provides career assessments to help "
                    "students discover suitable career paths. Your "
                    "assessment responses and results may be stored "
                    "to generate career recommendations and allow you "
                    "to review your previous assessment results.",
              ),

              _PrivacySection(
                number: "3",
                title: "How We Use Your Information",
                content:
                    "We use the information we collect to provide and "
                    "improve CareerNepal services. This may include:\n\n"
                    "• Providing personalized career recommendations\n"
                    "• Managing your user account and profile\n"
                    "• Processing career assessments\n"
                    "• Showing relevant careers, courses and colleges\n"
                    "• Providing information about scholarships\n"
                    "• Responding to questions and support requests\n"
                    "• Improving the functionality and user experience "
                    "of the application",
              ),

              _PrivacySection(
                number: "4",
                title: "Career Recommendations",
                content:
                    "Career recommendations are generated based on "
                    "the information and assessment responses provided "
                    "by the user. These recommendations are intended "
                    "to provide guidance and should not be considered "
                    "as a guaranteed prediction of your future career.",
              ),

              _PrivacySection(
                number: "5",
                title: "Data Security",
                content:
                    "We take reasonable technical and organizational "
                    "measures to protect your personal information "
                    "from unauthorized access, loss, misuse, alteration "
                    "or disclosure. However, no method of electronic "
                    "storage or transmission over the internet can be "
                    "guaranteed to be completely secure.",
              ),

              _PrivacySection(
                number: "6",
                title: "Sharing of Information",
                content:
                    "CareerNepal does not sell or rent your personal "
                    "information to third parties. Your information "
                    "may only be used or shared when necessary to "
                    "provide the application's services, comply with "
                    "legal requirements, or protect the security and "
                    "rights of users and the application.",
              ),

              _PrivacySection(
                number: "7",
                title: "Your Account and Information",
                content:
                    "You can review and update certain information "
                    "associated with your account through your profile. "
                    "If you believe that your information is incorrect "
                    "or you have questions about your personal data, "
                    "please contact the CareerNepal team.",
              ),

              _PrivacySection(
                number: "8",
                title: "Children's Privacy",
                content:
                    "CareerNepal is designed primarily for students "
                    "and individuals exploring their education and "
                    "career options. We do not knowingly collect "
                    "personal information from children in violation "
                    "of applicable laws.",
              ),

              _PrivacySection(
                number: "9",
                title: "Changes to This Policy",
                content:
                    "We may update this Privacy Policy when necessary "
                    "to reflect changes in our services, technology, "
                    "or legal requirements. Any updated version will "
                    "replace the previous version of this policy.",
              ),

              _PrivacySection(
                number: "10",
                title: "Contact Us",
                content:
                    "If you have any questions, concerns, or suggestions "
                    "regarding this Privacy Policy or how your information "
                    "is handled, please contact the CareerNepal team "
                    "through the Contact Us section of the application.",
              ),

              const SizedBox(height: 25),

              // Footer
              Center(
                child: Column(
                  children: [
                    Text(
                      "CareerNepal",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      "Last updated: September 2026",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PrivacySection extends StatelessWidget {
  final String number;
  final String title;
  final String content;

  const _PrivacySection({
    required this.number,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      margin: const EdgeInsets.only(
        bottom: 16,
      ),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                height: 32,
                width: 32,
                alignment: Alignment.center,

                decoration: BoxDecoration(
                  color: const Color(0xffEAF2FF),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Text(
                  number,
                  style: const TextStyle(
                    color: Color(0xff0F62BC),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            content,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

