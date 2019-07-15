import 'package:example_flutter/models/property_scoped_model.dart';
import 'package:example_flutter/ui_widgets/property_item.dart';
import 'package:example_flutter/ui_widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

// Scoped Model allows pass data to widgets more easily, where receives a list of PropertyScopeModel.
// This widget aways rebuild when the data response changes.

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScopedModelDescendant<PropertyScopedModel>(
            builder: (context, child, model) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                title: SearchWidget(
                  performSearch: model.getProperties,
                ),
              ),
              model.isLoading
                  ? SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Column(
                            children: <Widget>[
                              PropertyItem(model.properties[index]),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Divider(height: 1, color: Colors.grey),
                              )
                            ],
                          );
                        },
                        childCount: model.properties.length,
                      ),
                    )
            ],
          );
        }),
      ),
    );
  }
}
