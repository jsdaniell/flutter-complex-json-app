import 'package:example_flutter/models/property_scoped_model.dart';
import 'package:example_flutter/ui_widgets/property_item.dart';
import 'package:example_flutter/ui_widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:example_flutter/screens/DetailScreen.dart';

// Scoped Model allows pass data to widgets more easily, where receives a list of PropertyScopeModel.
// This widget aways rebuild when the data response changes.

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ScrollController controller;
  int page = 1;

  @override
  void initState() {
    super.initState();
    controller = new ScrollController()..addListener(_scrollListener);

    // Two dots (..) represents the same action that [controller.addListener] after [new ScrollController]
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void _scrollListener() {
    var props = PropertyScopedModel.of(context);
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      if (!props.isLoadingMore && props.hasMorePages) {
        page++;
        props.getProperties(props.placeName, page);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScopedModelDescendant<PropertyScopedModel>(
            builder: (context, child, model) {
          return CustomScrollView(
            controller: controller,
            slivers: <Widget>[
              SliverAppBar(
                title: SearchWidget(
                  performSearch: model.getProperties,
                ),
                floating: true,
                snap: true,
              ),
              model.isLoading
                  ? SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : model.getPropertyCount() < 1
                      ? SliverFillRemaining(
                          child: Center(
                            child: Text(
                              model.statusText,
                              style: Theme.of(context).textTheme.headline,
                            ),
                          ),
                        )
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              if (index == model.getPropertyCount() + 1) {
                                if (model.hasMorePages) {
                                  return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ));
                                }
                                return Container();
                              } else if (index == 0) {
                                return Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[300]))),
                                  child: Text(
                                    "${model.totalResults} results",
                                    style: Theme.of(context)
                                        .textTheme
                                        .body2
                                        .copyWith(color: Colors.grey[600]),
                                  ),
                                );
                              } else {
                                return Column(
                                  children: <Widget>[
                                    InkWell(
                                      child: PropertyItem(
                                          model.properties[index - 1]),
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(model
                                                      .properties[index - 1])),
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Divider(
                                          height: 1, color: Colors.grey),
                                    )
                                  ],
                                );
                              }
                            },
                            childCount: model.getPropertyCount() + 2,
                          ),
                        )
            ],
          );
        }),
      ),
    );
  }
}
