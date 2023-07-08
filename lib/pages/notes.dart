import 'package:flutter/material.dart';
import 'package:ses_finance/configurations/AppColors.dart';
import 'package:ses_finance/configurations/BigText.dart';
import 'package:ses_finance/configurations/SmallText.dart';
import 'package:ses_finance/const.dart';
import 'package:ses_finance/widgets/PrimaryInputField.dart';
import 'package:ses_finance/widgets/primary_button.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  TextEditingController TextEditControl = TextEditingController();

  String ErrorMessage = "";

  @override
  void initState() {
    // TODO: implement initState

    TextEditControl.text = "These are your Old Remainers";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
            text: "Add your Remainders/Notes/Thoughts/Pendings/Laibilities:"),
        SizedBox(
          height: 15,
        ),
        Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                minLines: 15,
                maxLines: 15,
                // onChanged: (value) => onChange,
                controller: TextEditControl,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: cardBackgroundColor,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ErrorMessage == ""
                            ? Colors.transparent
                            : Colors.red),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                        color: ErrorMessage == ""
                            ? Theme.of(context).primaryColor
                            : Colors.red
                        //Theme.of(context).primaryColor
                        ),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  hintText: "Add quick remainders",
                  // prefixIcon: Icon(
                  //   Icons.description,
                  //   color: Colors.grey,
                  //   size: 21,
                  // )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SmallText(
                  iscentre: false,
                  text: "",
                  color: Colors.red,
                  size: 10,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        PrimaryButton(
            isExpanded: true,
            TapAction: () {},
            text: "Update Notes",
            color: AppColors.PrimaryColor,
            icon: Icons.update)
      ],
    );
  }
}
