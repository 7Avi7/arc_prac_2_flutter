import 'package:architec_practice2/core/enums/view_state.dart';
import 'package:architec_practice2/core/models/profile_model.dart';
import 'package:architec_practice2/core/services/profile_api.dart';
import 'package:architec_practice2/core/view_models/base_view_model.dart';
import 'package:architec_practice2/locator.dart';

class ProfileViewModel extends BaseViewModel {
  final ProfileAPI _profileAPI = locator<ProfileAPI>();

  List<ProfileModel> profile = [];

  Future<void> getProfile() async {
    setViewState(ViewState.busy);

    profile = await _profileAPI.getProfileAPI();

    setViewState(ViewState.idle);
  }
}
