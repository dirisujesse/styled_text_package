import 'dart:ui' as ui show TextHeightBehavior;
import 'package:flutter/material.dart';
import 'package:styled_text/src/tags/styled_text_tag_base.dart';

class StyledRichText extends StatelessWidget {
  final TextSpan textSpan;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final TextScaler textScaler;
  final int? maxLines;
  final Locale? locale;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final ui.TextHeightBehavior? textHeightBehavior;

  const StyledRichText(
    this.textSpan, {
    super.key,
    Map<String, StyledTextTagBase>? tags,
    this.textAlign,
    this.textDirection,
    this.softWrap = true,
    this.overflow,
    required this.textScaler,
    this.maxLines,
    this.locale,
    this.strutStyle,
    this.textWidthBasis,
    this.textHeightBehavior,
  });

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context);
    final registrar = SelectionContainer.maybeOf(context);

    Widget result = RichText(
      textAlign: textAlign ?? defaultTextStyle.textAlign ?? TextAlign.start,
      textDirection: textDirection,
      softWrap: softWrap ?? defaultTextStyle.softWrap,
      overflow:
          overflow ?? textSpan.style?.overflow ?? defaultTextStyle.overflow,
      textScaler: textScaler,
      maxLines: maxLines ?? defaultTextStyle.maxLines,
      locale: locale,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis ?? defaultTextStyle.textWidthBasis,
      textHeightBehavior: textHeightBehavior ??
          defaultTextStyle.textHeightBehavior ??
          DefaultTextHeightBehavior.maybeOf(context),
      text: textSpan,
      selectionRegistrar: registrar,
      selectionColor: DefaultSelectionStyle.of(context).selectionColor,
    );

    if (registrar != null) {
      result = MouseRegion(
        cursor: SystemMouseCursors.text,
        child: result,
      );
    }

    return result;
  }
}
