// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:ses_finance/configurations/AppColors.dart';
import 'package:ses_finance/configurations/BigText.dart';
import 'package:ses_finance/models/events.dart';
import 'package:ses_finance/pages/loading.dart';
import 'package:ses_finance/widgets/PrimaryInputField.dart';
import 'package:ses_finance/widgets/message_bar.dart';
import 'package:ses_finance/widgets/primary_button.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  bool _isLoading = false;
  bool _isSuccess = false;
  DateTime _selectedDate = DateTime.now();
  TextEditingController _dateCtrl = TextEditingController();
  TextEditingController _titleCtrl = TextEditingController();
  TextEditingController _descCtrl = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    //      dateController.text='${selectedDate.day.toString()} / ${selectedDate.month.toString()} / ${selectedDate.year.toString()}';

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateCtrl.text = //_selectedDate.toString()
            '${_selectedDate.day.toString()} / ${_selectedDate.month.toString()} / ${_selectedDate.year.toString()}';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _dateCtrl.text =
        '${_selectedDate.day.toString()} / ${_selectedDate.month.toString()} / ${_selectedDate.year.toString()}';
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading == true
        ? Loading(
            message: "Hold on while we're adding new Event",
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _isSuccess == true
                  ? const Column(
                      children: [
                        MessageBar(
                          message: "Event Added Sucessfully",
                          message_type: 0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    )
                  : const SizedBox(),
              BigText(text: "Add New Event"),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: PrimaryInputField(
                    isDisable: true,
                    isExpanded: true,
                    placeholderText: "Choose the date",
                    PrefixIcon: Icons.date_range,
                    isPassword: false,
                    ErrorMessage: "",
                    TextEditControl: _dateCtrl,
                    onChange: () {}),
              ),
              PrimaryInputField(
                  isExpanded: true,
                  placeholderText: "Enter Event Title",
                  PrefixIcon: Icons.title_outlined,
                  isPassword: false,
                  ErrorMessage: "",
                  TextEditControl: _titleCtrl,
                  onChange: () {}),
              PrimaryInputField(
                  isExpanded: true,
                  placeholderText: "Enter Event Description",
                  PrefixIcon: Icons.description,
                  isPassword: false,
                  ErrorMessage: "",
                  TextEditControl: _descCtrl,
                  onChange: () {}),
              PrimaryButton(
                  isExpanded: true,
                  TapAction: () async {
                    setState(() {
                      _isLoading = true;
                    });

                    await AddNewEvent(_titleCtrl.text, _descCtrl.text,
                        _selectedDate.toString());

                    setState(() {
                      _titleCtrl.text = "";
                      _descCtrl.text = "";

                      _isSuccess = true;
                      _isLoading = false;
                    });
                  },
                  text: "Add Event",
                  color: AppColors.PrimaryColor,
                  icon: Icons.add)
            ],
          );
  }
}
