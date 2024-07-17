import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/view/login/what_your_goal_view.dart';
import 'package:flutter/material.dart';

import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({super.key});

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  TextEditingController txtFarmName = TextEditingController();
  TextEditingController txtFarmSize = TextEditingController();
  TextEditingController txtIrrigationFrequency = TextEditingController();
  String selectedCropType = "Tomatoes";
  String selectedWaterSource = "Well";
  String selectedIrrigationSystem = "Drip";
  String selectedExperienceLevel = "Beginner";

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/img/complete_profile.png",
                  width: media.width,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Text(
                  "Complétons votre profil",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Cela nous aidera à mieux vous connaître et à optimiser l'irrigation de votre ferme!",
                  style: TextStyle(color: TColor.gray, fontSize: 12),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      
                      RoundTextField(
                        controller: txtFarmSize,
                        hitText: "Superficie de la ferme (en hectares)",
                        icon: "assets/img/size.png",
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          prefixIcon: Image.asset(
                            "assets/img/crop.png",
                            width: 20,
                            height: 20,
                            fit: BoxFit.contain,
                            color: TColor.gray,
                          ),
                          hintText: "Type de cultures",
                        ),
                        items: ["Tomatoes", "Corn", "Wheat", "Other"]
                            .map((crop) => DropdownMenuItem(
                                  value: crop,
                                  child: Text(crop),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCropType = value!;
                          });
                        },
                        value: selectedCropType,
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          prefixIcon: Image.asset(
                            "assets/img/water.png",
                            width: 20,
                            height: 20,
                            fit: BoxFit.contain,
                            color: TColor.gray,
                          ),
                          hintText: "Source d'eau",
                        ),
                        items: ["Well", "River", "Rainwater", "Other"]
                            .map((source) => DropdownMenuItem(
                                  value: source,
                                  child: Text(source),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedWaterSource = value!;
                          });
                        },
                        value: selectedWaterSource,
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          prefixIcon: Image.asset(
                            "assets/img/irrigation.png",
                            width: 20,
                            height: 20,
                            fit: BoxFit.contain,
                            color: TColor.gray,
                          ),
                          hintText: "Système d'irrigation utilisé",
                        ),
                        items: ["Drip", "Sprinkler", "Flood", "Other"]
                            .map((system) => DropdownMenuItem(
                                  value: system,
                                  child: Text(system),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedIrrigationSystem = value!;
                          });
                        },
                        value: selectedIrrigationSystem,
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      RoundTextField(
                        controller: txtIrrigationFrequency,
                        hitText: "Fréquence d'irrigation (par semaine)",
                        icon: "assets/img/frequency.png",
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          prefixIcon: Image.asset(
                            "assets/img/experience.png",
                            width: 20,
                            height: 20,
                            fit: BoxFit.contain,
                            color: TColor.gray,
                          ),
                          hintText: "Niveau d'expérience agricole",
                        ),
                        items: ["Beginner", "Intermediate", "Expert"]
                            .map((level) => DropdownMenuItem(
                                  value: level,
                                  child: Text(level),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedExperienceLevel = value!;
                          });
                        },
                        value: selectedExperienceLevel,
                      ),
                      SizedBox(
                        height: media.width * 0.07,
                      ),
                      RoundButton(
                          title: "Suivant >",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WhatYourGoalView()));
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
