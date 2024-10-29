import 'dart:ui' as ui show TextHeightBehavior, BoxHeightStyle, BoxWidthStyle;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:styled_text/src/tags/styled_text_tag_base.dart';

class StyledSelectableText extends StatelessWidget {
  final TextSpan textSpan;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextScaler? textScaler;
  final int? maxLines;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final ui.TextHeightBehavior? textHeightBehavior;

  const StyledSelectableText(
    this.textSpan, {
    super.key,
    Map<String, StyledTextTagBase>? tags,
    this.textAlign,
    this.textDirection,
    this.textScaler,
    this.maxLines,
    this.strutStyle,
    this.textWidthBasis,
    this.textHeightBehavior,
    FocusNode? focusNode,
    bool showCursor = false,
    bool autofocus = false,
    @Deprecated(
      'Use `contextMenuBuilder` instead. '
      'This feature was deprecated after Flutter v3.3.0-0.5.pre.',
    )
    // ignore: deprecated_member_use
    ToolbarOptions? toolbarOptions,
    EditableTextContextMenuBuilder? contextMenuBuilder,
    TextSelectionControls? selectionControls,
    ui.BoxHeightStyle selectionHeightStyle = ui.BoxHeightStyle.tight,
    ui.BoxWidthStyle selectionWidthStyle = ui.BoxWidthStyle.tight,
    SelectionChangedCallback? onSelectionChanged,
    TextMagnifierConfiguration? magnifierConfiguration,
    double cursorWidth = 2.0,
    double? cursorHeight,
    Radius? cursorRadius,
    Color? cursorColor,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    bool enableInteractiveSelection = true,
    GestureTapCallback? onTap,
    ScrollPhysics? scrollPhysics,
    String? semanticsLabel,
  })  : this._focusNode = focusNode,
        this._showCursor = showCursor,
        this._autofocus = autofocus,
        this._toolbarOptions = toolbarOptions ??
            // ignore: deprecated_member_use
            const ToolbarOptions(
              selectAll: true,
              copy: true,
            ),
        this._contextMenuBuilder = contextMenuBuilder,
        this._selectionHeightStyle = selectionHeightStyle,
        this._selectionWidthStyle = selectionWidthStyle,
        this._selectionControls = selectionControls,
        this._onSelectionChanged = onSelectionChanged,
        this._magnifierConfiguration = magnifierConfiguration,
        this._cursorWidth = cursorWidth,
        this._cursorHeight = cursorHeight,
        this._cursorRadius = cursorRadius,
        this._cursorColor = cursorColor,
        this._dragStartBehavior = dragStartBehavior,
        this._enableInteractiveSelection = enableInteractiveSelection,
        this._onTap = onTap,
        this._scrollPhysics = scrollPhysics,
        this._semanticsLabel = semanticsLabel;

  final FocusNode? _focusNode;
  final bool _showCursor;
  final bool _autofocus;

  // ignore: deprecated_member_use
  final ToolbarOptions? _toolbarOptions;
  final EditableTextContextMenuBuilder? _contextMenuBuilder;
  final TextSelectionControls? _selectionControls;
  final ui.BoxHeightStyle? _selectionHeightStyle;
  final ui.BoxWidthStyle? _selectionWidthStyle;
  final SelectionChangedCallback? _onSelectionChanged;
  final TextMagnifierConfiguration? _magnifierConfiguration;
  final double? _cursorWidth;
  final double? _cursorHeight;
  final Radius? _cursorRadius;
  final Color? _cursorColor;
  final DragStartBehavior _dragStartBehavior;
  final bool _enableInteractiveSelection;
  final GestureTapCallback? _onTap;
  final ScrollPhysics? _scrollPhysics;
  final String? _semanticsLabel;

  static Widget _defaultContextMenuBuilder(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      textSpan,
      focusNode: _focusNode,
      showCursor: _showCursor,
      autofocus: _autofocus,
      // ignore: deprecated_member_use
      toolbarOptions: _toolbarOptions,
      contextMenuBuilder: _contextMenuBuilder ?? _defaultContextMenuBuilder,
      selectionControls: _selectionControls,
      selectionHeightStyle: _selectionHeightStyle!,
      selectionWidthStyle: _selectionWidthStyle!,
      onSelectionChanged: _onSelectionChanged,
      magnifierConfiguration: _magnifierConfiguration,
      cursorWidth: _cursorWidth!,
      cursorHeight: _cursorHeight,
      cursorRadius: _cursorRadius,
      cursorColor: _cursorColor,
      dragStartBehavior: _dragStartBehavior,
      enableInteractiveSelection: _enableInteractiveSelection,
      onTap: _onTap,
      scrollPhysics: _scrollPhysics,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      textAlign: textAlign,
      textDirection: textDirection,
      textScaler: textScaler,
      maxLines: maxLines,
      strutStyle: strutStyle,
      semanticsLabel: _semanticsLabel,
    );
  }
}
