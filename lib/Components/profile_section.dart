import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_app/Provides/profile_provider.dart';

// ignore: must_be_immutable
class ProfileSection extends StatefulWidget {
  late String _title;
  late String _profileKey;
  late IconData _icon;

  ProfileSection({Key? key, required String title, required String profileKey, required IconData icon}) : super(key: key) {
    _title = title;
    _profileKey = profileKey;
    _icon = icon;
  }

  String get title => _title;
  String get profileKey => _profileKey;
  IconData get icon => _icon;

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  late String _title;
  late String _profileKey;
  late IconData _icon;
  int _isEdit = 0;

  late TextEditingController _textEditingController;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _title = widget.title;
    _profileKey = widget.profileKey;
    _icon = widget.icon;
  }

  @override
  Widget build(BuildContext context) {
    _textEditingController = TextEditingController(text: context.watch<ProfileProvider>().userProfile[_profileKey]!);
    return Padding(
      padding: const EdgeInsets.fromLTRB(33, 0, 33, 26),
      child: Row(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle, // Set the shape to circle
              color: Color.fromARGB(30, 0, 24, 51),
            ),
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(right: 16),
            child: Icon(_icon),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _title,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color.fromARGB(60, 0, 24, 51),
                  ),
                ),
                const SizedBox(height: 7,),
                (_isEdit == 0)
                ?
                Text(
                  context.watch<ProfileProvider>().userProfile[_profileKey]!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                )
                :
                TextField(
                  controller: _textEditingController,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15,),
          GestureDetector(
            onTap: () {
              setState(() {
                _isEdit = 1 - _isEdit;
                if(_isEdit == 0) {
                  context.read<ProfileProvider>().changeUserProfile(_profileKey, _textEditingController.text);
                }
              });
            },
            child: (_isEdit == 0)
            ? const Icon(
              Icons.edit,
            )
            : const Icon(
              Icons.done,
            ),
          )
        ],
      ),
    );
  }
}