import 'package:careernepal/core/utils/snackar_bar.dart';
import 'package:careernepal/core/utils/validators.dart';
import 'package:careernepal/widgets/custom_button.dart';
import 'package:careernepal/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class CollegeCourse_add extends StatefulWidget {
  const CollegeCourse_add({super.key});

  @override
  State<CollegeCourse_add> createState() => _CollegeCourse_addState();
}

class _CollegeCourse_addState extends State<CollegeCourse_add> {
  final courseNameController = TextEditingController();
   final durationController = TextEditingController();
   final careerPathController = TextEditingController();
   final entranceController = TextEditingController();
   final difficultyLevelController = TextEditingController();
   final affilitationController = TextEditingController();
   final streamController = TextEditingController();
   final tagsController = TextEditingController();
   final reguirementsController = TextEditingController();
   final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),title: Center(child: Text("Add College-Course")),),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
              
                children: [
                  CustomTextField(
                          hintText: "nist",
                          labelText: "College name",
                          controller:courseNameController ,
                          validator:Validators.validateName,
                        ),
                         SizedBox(height: 10,),
                   CustomTextField(
                          hintText: "Bca",
                          labelText: "Course name",
                          controller:courseNameController ,
                          validator:Validators.validateName,
                        ),
                         SizedBox(height: 10,),
                         CustomTextField(
                          hintText: "4",
                          labelText: "Duration",
                          controller:durationController ,
                          validator:Validators.validateName,
                        ),
                         SizedBox(height: 10,),
                         CustomTextField(
                          hintText: "20000",
                          labelText: "Approx. Annual fee",
                          controller:affilitationController ,
                          validator:Validators.validateName,
                        ),
                       
                         SizedBox(height: 10,),
                         CustomTextField(
                          hintText: "science",
                          labelText: "Admission Requirement",
                          controller:reguirementsController ,
                          validator:Validators.validateName,
                        ),
                                     SizedBox(height: 10,),
                         CustomTextField(
                          hintText: "computer lab",
                          labelText: "Facilities",
                          controller:streamController ,
                          validator:Validators.validateName,
                        ),
                        SizedBox(height: 20,),
                         CustomButton(
                    text: "Add Course",

                    onTap: () {

                      if (formKey
                          .currentState!
                          .validate()) {

                        showSnackBar(
                          context,
                          "Successful COurse adding",
                        );
                      }
                    },
                  ),

                  const SizedBox(height: 20),
                       
            
            
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}