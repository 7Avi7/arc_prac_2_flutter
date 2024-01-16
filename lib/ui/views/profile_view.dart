import 'package:architec_practice2/core/enums/view_state.dart';
import 'package:architec_practice2/core/view_models/profile_view_model.dart';
import 'package:architec_practice2/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      onModelReady: (model) {
        model.getProfile();
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
        ),
        body: Center(
          child: model.state == ViewState.idle
              ? ListView.builder(
                  itemCount: model.profile.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Container(
                        // color: Colors.green,
                        child: Text(
                            '${model.profile[index].name.toString()} \n \n ${model.profile[index].email.toString()} \n ${model.profile[index].address.toString()}'),
                      ),
                    ],
                  ),
                )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
