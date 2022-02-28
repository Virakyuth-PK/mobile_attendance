import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  final Color backgroundColor;
  final Color itemColor;
  final List<CustomBottomNavigationItem> children;
  final Function(int) onChange;
  final int currentIndex;

  CustomNavBar(
      {required this.backgroundColor,
      required this.itemColor,
      required this.children,
      required this.onChange,
      required this.currentIndex});

  @override
  State<StatefulWidget> createState() {
    return _CustomNavBarState();
  }
}

class _CustomNavBarState extends State<CustomNavBar> {
  void _changeIndex(int index) {
    if (widget.onChange != null) {
      widget.onChange(index);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: widget.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.children.map((item) {
          var color = widget.itemColor;
          var icon = item.icon;
          var label = item.label;
          int index = widget.children.indexOf(item);
          return GestureDetector(
            onTap: () {
              _changeIndex(index);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: widget.currentIndex == index
                  ? MediaQuery.of(context).size.width / widget.children.length +
                      20
                  : 50,
              padding: const EdgeInsets.only(left: 10, right: 10),
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: widget.currentIndex == index
                      ? color.withOpacity(0.3)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(
                    icon,
                    size: 20,
                    color: widget.currentIndex == index
                        ? color
                        : color.withOpacity(0.5),
                  ),
                  widget.currentIndex == index
                      ? Expanded(
                          flex: 2,
                          child: Text(
                            label,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline6!.merge(
                                TextStyle(
                                    color: widget.currentIndex == index
                                        ? color
                                        : color.withOpacity(0.5))),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CustomBottomNavigationItem {
  final IconData icon;
  final String label;
  final Color? color;

  CustomBottomNavigationItem(
      {required this.icon, required this.label, this.color});
}
