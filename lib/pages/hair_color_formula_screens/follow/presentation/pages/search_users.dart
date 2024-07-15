import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:take_a_look/core/extensions/number_extension.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/follow/view_model/follow_view_model.dart';

import '../../../../../core/data/models/user_model.dart';
import '../../../../../core/widgets/user_item.dart';

class SearchUsers extends StatefulWidget {
  const SearchUsers({super.key});

  @override
  State<SearchUsers> createState() => _SearchUsersState();
}

class _SearchUsersState extends State<SearchUsers> {
  @override
  void initState() {
    context.read<FollowViewModel>().searchEditingController.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FollowViewModel>(builder: (context, viewModel, _) {
      return Scaffold(
        //
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              viewModel.onTapSearch();
            },
          ),
          title: Text('Users'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: TextField(
                          controller: viewModel.searchEditingController,
                          decoration: const InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (text) {
                            viewModel.callSearchUser();
                          },
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        viewModel.searchEditingController.clear();
                        viewModel.callSearchUser();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PagedListView<int, UserModel>(
                  pagingController: viewModel.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<UserModel>(
                    itemBuilder: (context, item, index) =>
                        UserItem(userModel: item),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
