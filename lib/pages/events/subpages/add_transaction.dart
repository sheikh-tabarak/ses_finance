// ignore_for_file: non_constant_identifier_names, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:ses_finance/configurations/AppColors.dart';
import 'package:ses_finance/configurations/BigText.dart';
import 'package:ses_finance/configurations/SmallText.dart';
import 'package:ses_finance/const.dart';
import 'package:ses_finance/models/events.dart';
import 'package:ses_finance/models/transaction.dart';
import 'package:ses_finance/pages/loading.dart';
import 'package:ses_finance/widgets/PrimaryInputField.dart';
import 'package:ses_finance/widgets/message_bar.dart';
import 'package:ses_finance/widgets/primary_button.dart';

class AddTransaction extends StatefulWidget {
  final Event ClickedEvent;
  const AddTransaction({super.key, required this.ClickedEvent});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  bool _isLoading = false;
  bool _isSuccess = false;
  String? selectedValue;
  List<String> items = [
    'Add',
    'Subtract',
  ];

  DateTime _selectedDate = DateTime.now();
  TextEditingController _dateCtrl = TextEditingController();
  // TextEditingController _titleCtrl = TextEditingController();
  TextEditingController _descCtrl = TextEditingController();
  TextEditingController _amountCtrl = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());

    //      dateController.text='${selectedDate.day.toString()} / ${selectedDate.month.toString()} / ${selectedDate.year.toString()}';

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateCtrl.text =
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
            message: "Hold on while we're adding a new Transaction",
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _isSuccess == true
                  ? const Column(
                      children: [
                        MessageBar(
                          message: "Transaction Added Sucessfully",
                          message_type: 0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    )
                  : const SizedBox(),
              BigText(
                  text:
                      "Record Transaction in ${widget.ClickedEvent.Eventtitle}"),
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
              Center(
                child: Container(
                  padding: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: cardBackgroundColor),
                  width: double.infinity,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: SmallText(
                        text: 'Mode of Transaction',
                      ),
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              PrimaryInputField(
                  isOnlyNumbers: true,
                  isExpanded: true,
                  placeholderText: "Enter Transaction Amount",
                  PrefixIcon: Icons.attach_money,
                  isPassword: false,
                  ErrorMessage: "",
                  TextEditControl: _amountCtrl,
                  onChange: () {}),
              PrimaryInputField(
                  isExpanded: true,
                  placeholderText: "Enter Transaction Details",
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
                    await AddNewTransactiontoEvent(
                        widget.ClickedEvent.EventId,
                        _selectedDate.toString(),
                        _descCtrl.text,
                        double.parse(_amountCtrl.text),
                        selectedValue.toString());

                    setState(() {
                      _isLoading = false;
                      _isSuccess = true;
                    });
                  },
                  text: "Record Transaction",
                  color: AppColors.PrimaryColor,
                  icon: Icons.add)
            ],
          );
  }
}
