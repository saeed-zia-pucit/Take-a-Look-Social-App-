part of 'widgets.dart';

class AddPortfolio extends StatefulWidget {
  const AddPortfolio(
      {super.key, required this.onSuccess, required this.userModel});

  final Function onSuccess;
  final UserModel userModel;

  @override
  _AddPortfolioState createState() => _AddPortfolioState();
}

class _AddPortfolioState extends State<AddPortfolio> {
  bool _isVisible = false;
  bool _isImageAttached = false;
  String _selectedCategory = 'Other';

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AddPortfolioViewModel>(context, listen: false);

    model.selectedCategory=_selectedCategory;
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
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    child: !_isVisible
                        ? Container(
                            child: const Text(
                              'Add Portfolio...',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                  ),
                ],
              ),
              if (!_isVisible)
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () async {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                    // await model.pickImage();
                  },
                ),
              if (_isVisible)
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () async {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                    // await model.pickImage();
                  },
                ),
            ],
          ),
          if (_isVisible)
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
                          "Brunette",
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
                                  title: Text('Pick from gallery'),
                                  onTap: () => Navigator.pop(
                                      context, ImageSourceOption.gallery),
                                ),
                                ListTile(
                                  leading: Icon(Icons.camera_alt,
                                      color: AppColors.primaryColor),
                                  title: Text('Take a photo'),
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Saving post, Please wait!'),
                        ),
                      );
                      final result = await model.postPortfolio();
                      setState(() {
                        _isVisible = false;
                      });
                      if (result?.statusCode == 200) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Post successful submitted'),
                          ),
                        );
                        widget.onSuccess();
                      } else {
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
            )
        ],
      ),
    );
  }
}
