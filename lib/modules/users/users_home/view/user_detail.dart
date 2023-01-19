import 'package:flutter/material.dart';
import 'package:notes_flutter/common_components/custom_text_widget.dart';
import 'package:notes_flutter/models/user_model.dart';

class UserDetail extends StatelessWidget {
  UserModel userModel;

  UserDetail({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: "Name: ${userModel.name ?? ""}",
                  maxLines: 3,
                  fontSize: 22,
                ),
                CustomTextWidget(
                  text: "Username: ${userModel.username ?? ""}",
                  maxLines: 3,
                  fontSize: 22,
                ),
                CustomTextWidget(
                  text: "Email: ${userModel.email ?? ""}",
                  maxLines: 3,
                  fontSize: 22,
                ),
                CustomTextWidget(
                  text: "Street: ${userModel.address?.street ?? ""}",
                  maxLines: 3,
                  fontSize: 22,
                ),
                CustomTextWidget(
                  text: "Suite: ${userModel.address?.suite ?? ""}",
                  maxLines: 3,
                  fontSize: 22,
                ),
                CustomTextWidget(
                  text: "City: ${userModel.address?.city ?? ""}",
                  maxLines: 3,
                  fontSize: 22,
                ),
                CustomTextWidget(
                  text: "Zipcode: ${userModel.address?.zipcode ?? ""}",
                  maxLines: 3,
                  fontSize: 22,
                ),
                CustomTextWidget(
                  text: "Lat: ${userModel.address?.geo?.lat ?? ""}",
                  maxLines: 3,
                  fontSize: 22,
                ),
                CustomTextWidget(
                  text: "Long: ${userModel.address?.geo?.lng ?? ""}",
                  maxLines: 3,
                  fontSize: 22,
                ),
                CustomTextWidget(
                  text: "Phone: ${userModel.phone ?? ""}",
                  maxLines: 3,
                  fontSize: 22,
                ),
                CustomTextWidget(
                  text: "Website: ${userModel.website ?? ""}",
                  maxLines: 3,
                  fontSize: 22,
                ),
                CustomTextWidget(
                  text: "Company Name: ${userModel.company?.name ?? ""}",
                  maxLines: 3,
                  fontSize: 22,
                ),
                CustomTextWidget(
                  text:
                      "Company CatchPhrase: ${userModel.company?.catchPhrase ?? ""}",
                  maxLines: 3,
                  fontSize: 22,
                ),
                CustomTextWidget(
                  text: "Company BS: ${userModel.company?.bs ?? ""}",
                  maxLines: 3,
                  fontSize: 22,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
