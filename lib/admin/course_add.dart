import 'package:careernepal/core/snackar_bar.dart';
import 'package:careernepal/core/validators.dart';
import 'package:careernepal/widgets/custom_button.dart';
import 'package:careernepal/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class Course_add extends StatefulWidget {
  const Course_add({super.key});

  @override
  State<Course_add> createState() => _Course_addState();
}

class _Course_addState extends State<Course_add> {
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
      appBar: AppBar(leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),title: Center(child: Text("Add Course")),),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
              
                children: [
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
                          hintText: "tu",
                          labelText: "Affilitation",
                          controller:affilitationController ,
                          validator:Validators.validateName,
                        ),
                        SizedBox(height: 10,),
                         CustomTextField(
                          hintText: "software engineering",
                          labelText: "Typical Career Path",
                          controller:careerPathController ,
                          validator:Validators.validateName,
                        ),
                         SizedBox(height: 10,),
                         CustomTextField(
                          hintText: "IoE entrance",
                          labelText: "Reguired Entrance",
                          controller:entranceController ,
                          validator:Validators.validateName,
                        ),
            
             SizedBox(height: 10,),
                         CustomTextField(
                          hintText: "high",
                          labelText: "Difficulty level",
                          controller:difficultyLevelController ,
                          validator:Validators.validateName,
                        ),
            
             SizedBox(height: 10,),
                         CustomTextField(
                          hintText: "IT",
                          labelText: "Stream",
                          controller:streamController ,
                          validator:Validators.validateName,
                        ),
                         SizedBox(height: 10,),
                         CustomTextField(
                          hintText: "must have science, minimum 3.2 gpa",
                          labelText: "Requirement/ SEE criteria",
                          controller:reguirementsController ,
                          validator:Validators.validateName,
                        ),
                        
                         SizedBox(height: 10,),
                         CustomTextField(
                          hintText: "jfiufifjm",
                          labelText: "Description",
                          controller:descriptionController ,
                          validator:Validators.validateName,
                        ),
                         SizedBox(height: 10,),
                         CustomTextField(
                          hintText: "Computer, maths,",
                          labelText: "Tags",
                          controller:tagsController ,
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