import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/store_controller.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  String? hintName;
  bool? obscureText;
  Function(String)? onChanged;
  TextInputType? inputTybe;
  CustomTextField({
    Key? key,
    this.onChanged,
    this.hintName,
    this.obscureText = false,
    this.inputTybe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreController>(
        init: StoreController(),
        builder: (controller) {
          return TextField(
              keyboardType: inputTybe,
              // obscureText: hintName == "password"
              //     ? controller.hidePassword!
              //     : obscureText!,
              // ignore: body_might_complete_normally_nullable

              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hintName,
                suffixIcon: hintName == "password"
                    ? IconButton(
                        icon: const Icon(
                          Icons.hide_source,
                        ),
                        onPressed: () {
                          // controller.showPassword();
                        },
                      )
                    : null,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(6),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),

                  // borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                label: Text('$hintName'),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              ));
        });
  }
}
