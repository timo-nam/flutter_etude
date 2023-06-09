import 'package:flutter/material.dart';
import 'package:flutter_etude/models/user_model.dart';
import 'package:flutter_etude/services/api_service.dart';
import 'package:flutter_etude/widgets/gender_buttons_widget.dart';
import 'package:flutter_etude/widgets/simple_profile_widget.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});

  final Future<List<UserModel>> _users = ApiService.getUsersByGender();

  @override
  Widget build(BuildContext context) {
    const pictureSize = 256.0;

    return FutureBuilder(
      future: _users,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // ListView는 cross axis로 가능한 최대 사이즈를 가짐
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(32, 32, 32, 0),
                child: GenderButtons(),
              ),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 32,
                  ),
                  itemBuilder: (context, index) {
                    UserModel user = snapshot.data![index];
                    return SimpleProfile(
                      user: user,
                      pictureSize: pictureSize,
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 64,
                  ),
                  itemCount: snapshot.data!.length,
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
