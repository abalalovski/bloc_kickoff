import 'package:flutter/material.dart';

class NoContentWidget extends StatelessWidget {
  const NoContentWidget({
    @required this.title,
    this.icon,
    this.subtitle,
    this.cfaText,
    this.cfaIcon,
    this.onPressed,
    Key key,
  })  : assert(title != null, 'Title must be provided.'),
        super(key: key);

  final IconData icon;
  final String title;
  final String subtitle;
  final String cfaText;
  final IconData cfaIcon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Center(
          child: CustomMultiChildLayout(
            delegate: _NoContentWidgetDelegate(),
            children: <Widget>[
              LayoutId(
                id: _NoContentChildType.information,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (icon != null)
                      Icon(icon,
                          size: 80,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.2)),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 16,
                        bottom: 8,
                      ),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    if (subtitle != null)
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 16,
                        ),
                        child: Text(
                          subtitle,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                  ],
                ),
              ),
              if (onPressed != null && cfaText != null)
                LayoutId(
                  id: _NoContentChildType.button,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      top: 12,
                    ),
                    child: RaisedButton(
                      onPressed: onPressed,
                      child: Text(cfaText),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
}

// Referenced from the answer on SO here (https://stackoverflow.com/a/59483482)
class _NoContentWidgetDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    final informationSize = layoutChild(
      _NoContentChildType.information,
      BoxConstraints.loose(size),
    );

    positionChild(
      _NoContentChildType.information,
      Offset(
        (size.width - informationSize.width) / 2,
        (size.height - informationSize.height) / 2,
      ),
    );

    if (hasChild(_NoContentChildType.button)) {
      final buttonSize = layoutChild(
        _NoContentChildType.button,
        BoxConstraints.loose(size),
      );
      positionChild(
        _NoContentChildType.button,
        Offset(
          (size.width - buttonSize.width) / 2,
          (size.height + informationSize.height) / 2,
        ),
      );
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) =>
      oldDelegate != this;
}

enum _NoContentChildType {
  information,
  button,
}
