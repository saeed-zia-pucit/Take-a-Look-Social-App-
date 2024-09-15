part of 'widgets.dart';

class UpdatePortfolio extends StatefulWidget {
  const UpdatePortfolio(
      {super.key, required this.onSuccess, required this.userModel, required this.content, required this.selectedCategory, required this.postId});
  final String content;
  final String postId;
  final String selectedCategory;
  final Function onSuccess;
  final UserModel userModel;

  @override
  _UpdatePortfolioState createState() => _UpdatePortfolioState();
}

class _UpdatePortfolioState extends State<UpdatePortfolio> {
  bool _isImageAttached = false;
  bool _isLoading = false;
  late String _selectedCategory;
  //final model = Provider.of<AddPortfolioViewModel>(context, listen: false);
  late var model;
  @override
  initState(){
     model = Provider.of<AddPortfolioViewModel>(context, listen: false);
     model.contentController.text = widget.content;
     model.selectedCategory=widget.selectedCategory;
     print(widget.selectedCategory);
     String leadingString= widget.selectedCategory.substring(1).toLowerCase();
     _selectedCategory=widget.selectedCategory[0]+leadingString;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final model = Provider.of<AddPortfolioViewModel>(context, listen: false);
    // model.contentController.text = widget.content;
    // model.selectedCategory=widget.selectedCategory;
    UserModel userModel = widget.userModel;
    bool _isTextFieldVisible =
    false; // Set this to false when you want to hide the Text
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      // await model.pickImage();
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: userModel.avatarUrl == null ||
                              userModel.avatarUrl == ''
                              ? const AssetImage('assets/images/avatar.png')
                              : NetworkImage(userModel.avatarUrl ?? '')
                          as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: (){
                    Navigator.pop(context);
                    // setState(() {
                    //   _isVisible = !_isVisible;
                    // });
                    // await model.pickImage();
                  },
                ),
            ],
          ),
          if(!_isLoading)
          SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: model.contentController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      alignLabelWithHint: true,
                      hintText: 'Add Portfolio...',
                      // labelText: 'Add Portfolio...',
                    ),
                  ),
                  const SizedBox(height: 10),
                  _isTextFieldVisible
                      ? TextField(
                    controller: model.additionalUrlController,
                    decoration: const InputDecoration(
                        labelText: 'Additional URL'),
                  )
                      : Container(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Post Category:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      DropdownButton<String>(
                        value: _selectedCategory,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedCategory = newValue!;
                            model.selectedCategory=_selectedCategory;
                          });
                        },
                        items: <String>[
                          "Other",
                          "Brunet",
                          "Blonde",
                          "Red",
                          "Black"
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      _isTextFieldVisible
                          ? TextField(
                        controller: model.additionalNoteController,
                        decoration: const InputDecoration(
                            labelText: 'Additional Note'),
                      )
                          : Container(),
                      IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          color: AppColors.primaryColor,
                        ),
                        onPressed: () async {
                          final option =
                          await showModalBottomSheet<ImageSourceOption>(
                            context: context,
                            builder: (context) => Wrap(
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.photo_library,
                                      color: AppColors.primaryColor),
                                  title: const Text('Pick from gallery'),
                                  onTap: () => Navigator.pop(
                                      context, ImageSourceOption.gallery),
                                ),
                                ListTile(
                                  leading: Icon(Icons.camera_alt,
                                      color: AppColors.primaryColor),
                                  title: const Text('Take a photo'),
                                  onTap: () => Navigator.pop(
                                      context, ImageSourceOption.camera),
                                ),
                              ],
                            ),
                          );
                          if (option != null) {
                            setState(() {
                              _isImageAttached =
                              true; // Set this to true when an image is selected
                            });
                            await model.pickImage(option);
                          }
                        },
                      ),

                      //add dropdown for post category and add two categoreis other and me for test and also tive tiitle at left start and dropdown at riight end

                      Text(
                        _isImageAttached ? 'Image Attached' : 'Attach Image',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Saving post, Please wait!'),
                        ),
                      );
                      final result = await model.updatePortfolio(widget.postId);
                      setState(() {
                        _isLoading = false;
                      });
                      if (result?.statusCode == 200) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Post successful submitted'),
                          ),
                        );
                        widget.onSuccess();
                      } else {
                        setState(() {
                          _isLoading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Post submission failed'),
                          ),
                        );
                      }
                      // Disable the button
                      (context as Element).markNeedsBuild();
                      await Future.delayed(Duration(seconds: 3));
                      // Enable the button
                      (context as Element).markNeedsBuild();
                    },
                    child: const Text('Send'),
                  ),
                ],
              ),
            ),
          if(_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
