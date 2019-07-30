import 'package:example_flutter/ui_widgets/dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:example_flutter/models/property_scoped_model.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<PropertyScopedModel>(
      builder: (context, child, model) => Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Country"),
              trailing: CustomDropdownButton(
                  value: model.country,
                  items: model.countryList,
                  onChanged: model.setCountry),
            ),
            Divider(),
            ListTile(
              title: Text("Listing Type"),
              trailing: CustomDropdownButton(
                  value: model.listingType,
                  items: model.listingTypeList,
                  onChanged: model.setListingType),
            ),
            Divider(),
            ListTile(
              title: Text("Sort"),
              trailing: CustomDropdownButton(
                  value: model.sort,
                  items: model.sortList,
                  onChanged: model.setSort),
            ),
          ],
        ),
      ),
    );
  }
}
