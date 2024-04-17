
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:take_a_look/constants/app_colors.dart';
import 'package:take_a_look/constants/app_images.dart';
import 'package:take_a_look/core/widgets/avatar_with_size.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/comment/presentation/widgets/comment_item.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Comments'
        ),
      ),

      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      AvatarWithSize(
                        image: AppImages.avatar,
                        height: 25,
                        width: 25,
                      ),
                      const Gap(10),
                      const Text('Lavish Productline & 5 others commented  ')
                    ],
                  ),
                ),
                const CommentItem(),
                const CommentItem(),
                const CommentItem(),
                const CommentItem(),
                const CommentItem(),
                const CommentItem(),
                const CommentItem(),
                const CommentItem(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: AppColors.whiteColor,
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 50,
              ),
              child: TextField(
                controller: TextEditingController(text: 'Comments'),
                style: const TextStyle(
                  fontSize: 10,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.send, color: AppColors.greyColor,),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
