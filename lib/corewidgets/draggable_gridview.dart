import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/response/lifestyle_elements_api_responses/get_lifestyle_element_list_response.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/network/response/selected_lifestyle_elements_api_responses/get_selected_lifestyle_elements_response.dart';
import 'package:well_path/features/onboarding/lifestyle_elements/ui/selected_lifestyle_elements_page.dart';

class DraggableGridView extends StatefulWidget {
  const DraggableGridView({super.key, required this.items});

  final List<SelectedLifestyleItem> items;

  @override
  State<DraggableGridView> createState() => _DraggableGridViewState();
}

class _DraggableGridViewState extends State<DraggableGridView> {
  final List<DraggableGridItem> _listOfDraggableGridItem = [];
  final ScrollController _scrollController = ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );

  @override
  void initState() {
    _generateImageData();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableGridViewBuilder(
      padding: const EdgeInsets.all(10),
      controller: _scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 15.0,
        crossAxisCount: 1,
        childAspectRatio: 2,
      ),
      children: _listOfDraggableGridItem,
      dragCompletion: onDragAccept,
      dragFeedback: feedback,
      dragPlaceHolder: placeHolder,
      dragChildWhenDragging: feedback,
    );
  }

  Widget feedback(List<DraggableGridItem> list, int index) {
    return SizedBox(
        width: 200, height: 150, child: GridItem(element: widget.items[index]));
  }

  PlaceHolderWidget placeHolder(List<DraggableGridItem> list, int index) {
    return PlaceHolderWidget(
      child: Container(
        color: Colors.white,
      ),
    );
  }

  void onDragAccept(
      List<DraggableGridItem> list, int beforeIndex, int afterIndex) {
    // debugPrint('onDragAccept: $beforeIndex -> $afterIndex');

    final temp = _listOfDraggableGridItem[beforeIndex];
    _listOfDraggableGridItem[beforeIndex] =
        _listOfDraggableGridItem[afterIndex];
    _listOfDraggableGridItem[afterIndex] = temp;
  }

  void _generateImageData() {
    for (var i = 0; i < widget.items.length; i++) {
      _listOfDraggableGridItem.add(DraggableGridItem(
          child: GridItem(element: widget.items[i]), isDraggable: true));
    }
  }
}

class GridItem extends StatefulWidget {
  final SelectedLifestyleItem element;
  const GridItem({Key? key, required this.element}) : super(key: key);

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 4.0,
        vertical: 8.0,
      ),
      child: SelectedLifestyleElementGridTile(
        element: widget.element,
      ),
    );
  }
}
