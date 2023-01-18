import 'package:flutter/material.dart';
import 'package:notes_flutter/utils/custom_text_widget.dart';
import 'package:notes_flutter/view/multiple_provider_home_page/multiple_provider_home_page.dart';
import 'package:notes_flutter/view/single_provider_view/single_provider_home_page.dart';

class DefaultHome extends StatelessWidget {
  const DefaultHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SingleProviderHomePage()));
                },
                child: CustomTextWidget(text: "Single Provider")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MultipleProviderHomePage()));
                },
                child: CustomTextWidget(text: "Multiple Provider")),
          ],
        ),
      ),
    );
  }
}
