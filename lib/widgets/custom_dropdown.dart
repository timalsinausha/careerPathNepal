import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/register_provider.dart';

class CustomDropdown extends StatelessWidget {

  const CustomDropdown({super.key});

  @override
  Widget build(BuildContext context) {

    final provider =
        Provider.of<RegisterProvider>(context);

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [

        const Text(
          "Enter level of Education",
          style: TextStyle(fontSize: 12),
        ),

        const SizedBox(height: 5),

        Container(
          padding:
              const EdgeInsets.symmetric(
            horizontal: 12,
          ),

          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius:
                BorderRadius.circular(5),
          ),

          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: provider.education,
              isExpanded: true,

              items:
                  provider.educationList.map((e) {

                return DropdownMenuItem(
                  value: e,
                  child: Text(e),
                );
              }).toList(),

              onChanged: (value) {

                provider.changeEducation(
                  value!,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}