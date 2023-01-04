part of '../views.dart';

Widget promoScroll(List<Widget> listPromo, BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: listPromo.asMap().map((i, e) => MapEntry(i,
          Container(
            margin: EdgeInsets.only(left: 5),
            width: MediaQuery.of(context).size.width * 0.87,
            child: e,
          ))
      ).values.toList(),
    ),
  );
}

Widget autoCompleteTextFieldCustom(List<DestinationModelData> listDestination, Function(DestinationModelData) onSelected, Function(String) onChanged) {
  return Autocomplete<DestinationModelData>(
    optionsMaxHeight: 150,
    optionsBuilder: (TextEditingValue textEditingValue) {
      return listDestination
          .where((DestinationModelData destination) => destination.name.toLowerCase()
          .startsWith(textEditingValue.text.toLowerCase())
      ).toList();
    },
    displayStringForOption: (DestinationModelData option) => option.name,
    fieldViewBuilder: (
        BuildContext context,
        TextEditingController fieldTextEditingController,
        FocusNode fieldFocusNode,
        VoidCallback onFieldSubmitted
        ) {
      return Container(
        height: 30,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide()
            ),
          ),
          controller: fieldTextEditingController,
          focusNode: fieldFocusNode,
          style: const TextStyle(fontWeight: FontWeight.bold),
          onChanged: (value) => onChanged(value),
        ),
      );
    },
    onSelected: (DestinationModelData selection) => onSelected(selection),
  );
}