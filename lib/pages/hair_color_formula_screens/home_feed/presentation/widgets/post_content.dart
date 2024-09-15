
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
        Image.network(
          post.imageUrl,
          height: context.width - 100,
          width: double.infinity,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress){
            if (loadingProgress == null) {
              return child; // Image is fully loaded, display it.
            } else {
              // Show a CircularProgressIndicator while loading.
              return SizedBox(
                height: context.width - 100,
                width: double.infinity,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
        // Image(
        //   image: NetworkImage( post.imageUrl,
        //   ),
        //   height: context.width - 100,
        //   width: double.infinity,
        //   fit: BoxFit.cover,
        // )
      ],
    );
  }
}
