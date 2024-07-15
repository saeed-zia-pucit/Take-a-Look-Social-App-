
part of 'widgets.dart';

class PostContent extends StatelessWidget {
  const PostContent({super.key,required this.post});
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Container(
           alignment: Alignment.centerLeft,
           child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(post.content, style: TextStyle(color: AppColors.blackColor)
              ,textAlign: TextAlign.start,
            ),
                   ),
         ),
        Image(
          image: NetworkImage( post.imageUrl),
          height: context.width - 100,
          width: double.infinity,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}
