import 'package:elegant_alert_dialog/resources/colors.dart';
import 'package:elegant_alert_dialog/resources/elegant_notification_type.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ElegantAlertDialog extends StatelessWidget {
  ElegantAlertDialog({
    super.key,
    required this.description,
    this.title,
    this.backgroundColor = Colors.white,
    this.radius = 0,
    this.borderColor,
    this.actions = const [],
  });

  ElegantAlertDialog.multiActions({
    super.key,
    required this.description,
    this.title,
    this.primaryButtonColor = Colors.blue,
    this.primaryButtonText = 'Confirm',
    this.onPrimaryButtonPressed,
    this.secondButtonColor = Colors.grey,
    this.secondButtonText = 'Learn more',
    this.onSecondaryButtonPressed,
    this.customButtonColor = Colors.green,
    this.customButtonText = 'Cancel',
    this.onCustomButtonPressed,
  }) {
    borderColor = successColor;
    backgroundColor = Colors.white;
    radius = 5;
    elegantNotificationType = ElegantNotificationMultiActions(
      primaryActionText: primaryButtonText!,
      secondaryActionText: secondButtonText!,
      customActionText: customButtonText!,
      primaryButtonColor: primaryButtonColor!,
      secondaryButtonColor: secondButtonColor!,
      customButtonColor: customButtonColor!,
      onPrimaryButtonPressed: onPrimaryButtonPressed,
      onSecondaryButtonPressed: onSecondaryButtonPressed,
      onCustomButtonPressed: onCustomButtonPressed,
    );
  }

  ElegantAlertDialog.permission({
    super.key,
    required this.description,
    this.title,
  }) {
    borderColor = successColor;
    backgroundColor = Colors.white;
    radius = 5;
  }

  ElegantAlertDialog.delete({
    super.key,
    required this.description,
    this.title,
  }) {
    borderColor = errorColor;
    backgroundColor = Colors.white;
    radius = 5;
  }

  ElegantAlertDialog.info({
    super.key,
    required this.description,
    this.title,
  }) {
    borderColor = inforColor;
    backgroundColor = Colors.white;
    radius = 5;
  }

  final Widget? title;
  final Widget description;
  late Color backgroundColor;
  late Color? borderColor;
  late double radius;
  late List<Widget> actions;

  //! multi actions constructor
  String? primaryButtonText;
  String? secondButtonText;
  String? customButtonText;

  Function()? onPrimaryButtonPressed;
  Function()? onSecondaryButtonPressed;
  Function()? onCustomButtonPressed;

  Color? primaryButtonColor;
  Color? secondButtonColor;
  Color? customButtonColor;

  late ElegantNotificationType? elegantNotificationType;

  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: this,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Colors.orange,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 10,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'This is serious!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                children: [
                  Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: (){}, child: Text(customButtonText!)),
                        TextButton(onPressed: (){}, child: Text(secondButtonText!)),
                        ElevatedButton(onPressed: (){}, child: Text(primaryButtonText!)),
                      ],
                    ),
                  )
                
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
