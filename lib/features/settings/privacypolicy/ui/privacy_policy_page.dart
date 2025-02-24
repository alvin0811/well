import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
          
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("Privacy Policy" , style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 30),),],),
                        Text("This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.\n\n\nWe use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the Privacy Policy Generator.")
                       , Text("\nInterpretation and Definitions" , style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.purpleAccent,fontSize: 25),),
                        Text("\nInterpretation" , style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.purpleAccent,fontSize: 20),),
                        Text("\nThe words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.\n\n")
                    ,Text("\nDefinitions" , style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.purpleAccent,fontSize: 20),),
                     
                ],
            ),
          ),
        ),
      ),
    );
  }
}