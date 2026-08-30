import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  Future<void> _openUrl(Uri url) async {
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(
          url,
          mode: LaunchMode.externalApplication,
        );
      } else {
        debugPrint("Could not launch $url");
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  Future<void> openWebView(String url) async {
  final Uri uri = Uri.parse(url);

  try {
    final launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    print("Launch result: $launched");
  } catch (e) {
    print("Could not launch $url");
    print(e);
  }
}

Future<void> sendEmail(String email) async {
  final Uri uri = Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {
      'subject': 'CareerNepal Inquiry',
      'body': 'Hello CareerNepal Team,',
    },
  );

  try {
    final launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    print("Email launch result: $launched");
  } catch (e) {
    print("Could not launch email: $e");
  }
}

 Future<void> makePhoneCall(String phoneNumber) async {
  final Uri uri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );

  try {
    final launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    print("Phone launch result: $launched");
  } catch (e) {
    print("Could not launch phone: $e");
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(
        title: const Text(
          "Contact Us",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 20),

            // Header
            Center(
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: const Color(0xff0F62BC),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(
                  Icons.support_agent,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                "Get In Touch",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Have questions, suggestions, or need help? "
              "We would love to hear from you. "
              "Our team is here to help you with your CareerNepal journey.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Contact Information",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // Email
            _ContactTile(
              icon: Icons.email_outlined,
              title: "Email",
              subtitle: "timalsinausha414@gmail.com",
              onTap:  () async {
    await sendEmail("your-email@gmail.com");
  },
            ),

            const SizedBox(height: 12),

            // Phone
            _ContactTile(
              icon: Icons.phone_outlined,
              title: "Phone",
              subtitle: "+977 9867678248",
              onTap:  () async {
    await makePhoneCall("+9779867678248");
  },
            ),

            const SizedBox(height: 30),

            const Text(
              "Follow Us",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // Facebook
            _ContactTile(
              icon: Icons.facebook,
              title: "Facebook",
              subtitle: "Follow CareerNepal on Facebook",
             onTap: () async {
  await openWebView(
    "https://www.facebook.com/",
  );
},
            ),

            const SizedBox(height: 12),

            // Instagram
            _ContactTile(
              icon: Icons.camera_alt_outlined,
              title: "Instagram",
              subtitle: "Follow CareerNepal on Instagram",
              onTap: () async {
                await openWebView(
                  "https://www.instagram.com/",
                );
              },
            ),

            const SizedBox(height: 35),

            Center(
              child: Text(
                "CareerNepal",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                ),
              ),
            ),

            const SizedBox(height: 5),

            Center(
              child: Text(
                "Helping you discover the right career path.",
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ContactTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [

              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: const Color(0xffEAF2FF),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  color: const Color(0xff0F62BC),
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [

                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

