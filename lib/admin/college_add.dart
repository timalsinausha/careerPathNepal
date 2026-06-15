import 'package:careernepal/core/snackar_bar.dart';
import 'package:careernepal/core/validators.dart';
import 'package:careernepal/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_textfield.dart';

class AddCollegeForm extends StatefulWidget {
  const AddCollegeForm({super.key});

  @override
  State<AddCollegeForm> createState() => _AddCollegeFormState();
}

class _AddCollegeFormState extends State<AddCollegeForm> {
   final collegeNameController = TextEditingController();
   final locationController = TextEditingController();
   final provinceController = TextEditingController();
   final districtController = TextEditingController();
   final typeController = TextEditingController();
   final affilitationController = TextEditingController();
   final contactController = TextEditingController();
   final emailController = TextEditingController();
   final websiteController = TextEditingController();
   final admissionReguirementsController = TextEditingController();
   final descriptionController = TextEditingController();
   final facilitiesController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),title: Center(child: Text("Add College")),),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
              
                children: [
                   CustomTextField(
                          hintText: "nist college",
                          labelText: "College name",
                          controller:collegeNameController ,
                          validator:Validators.validateName,
                        ),
                         SizedBox(height: 10,),
                         CustomTextField(
                          hintText: "9898980000",
                          labelText: "Contact",
                          controller:contactController ,
                          validator:Validators.validateName,
                        ),
                        SizedBox(height: 10,),
                         CustomTextField(
                          hintText: "banepa",
                          labelText: "Location (City)",
                          controller:locationController ,
                          validator:Validators.validateName,
                        ),
                         SizedBox(height: 10,),
                         CustomTextField(
                          hintText: "Bagmati",
                          labelText: "Province",
                          controller:provinceController ,
                          validator:Validators.validateName,
                        ),
            
             SizedBox(height: 10,),
                         CustomTextField(
                          hintText: "kavrepalanchok",
                          labelText: "District",
                          controller:districtController ,
                          validator:Validators.validateName,
                        ),
            
             SizedBox(height: 10,),
                         CustomTextField(
                          hintText: "public",
                          labelText: "Type",
                          controller:typeController ,
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
                          hintText: "nist@gmail.com",
                          labelText: "Email",
                          controller:emailController ,
                          validator:Validators.validateName,
                        ),
                         SizedBox(height: 10,),
                         CustomTextField(
                          hintText: "nist.com",
                          labelText: "Website link",
                          controller:websiteController ,
                          validator:Validators.validateName,
                        ),
                         SizedBox(height: 10,),
                         CustomTextField(
                          hintText: "+2",
                          labelText: "Admission requirement",
                          controller:admissionReguirementsController ,
                          validator:Validators.validateName,
                        ),
                         SizedBox(height: 10,),
                         CustomTextField(
                          hintText: "Computer lab,",
                          labelText: "Facilities",
                          controller:facilitiesController ,
                          validator:Validators.validateName,
                        ),
                         SizedBox(height: 10,),
                         CustomTextField(
                          hintText: "jfiufifjm",
                          labelText: "Description",
                          controller:descriptionController ,
                          validator:Validators.validateName,
                        ),
                        SizedBox(height: 20,),
                         CustomButton(
                    text: "Add College",

                    onTap: () {

                      if (formKey
                          .currentState!
                          .validate()) {

                        showSnackBar(
                          context,
                          "Successful college adding",
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