import 'package:flutter/cupertino.dart';
import 'package:pp_442/core/extensions/theme_context_extension.dart';
import 'package:pp_442/core/ui/custom_icon.dart';
import 'package:pp_442/gen/assets.gen.dart';

class StageWidget extends StatefulWidget {
  final String stageLetter;
  final String stage;
  final Function(String val) onChanged;
  const StageWidget({
    super.key,
    required this.stageLetter,
    required this.stage,
    required this.onChanged,
  });

  @override
  State<StageWidget> createState() => _StageWidgetState();
}

class _StageWidgetState extends State<StageWidget> {
  final _stageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _stageController.text = widget.stage;

    _stageController.addListener(() {
      widget.onChanged(_stageController.text);
    });
  }

  @override
  void didUpdateWidget(covariant StageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.stage != oldWidget.stage) {
      _stageController.text = widget.stage;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _stageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.colors.primary,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Make a note',
                    style: context.text.displaySmall.copyWith(
                      color: context.colors.onPrimary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  CustomIcon(Assets.icons.note),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Stage',
                    style: context.text.bodySmall.copyWith(
                      color: context.colors.onPrimary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.stageLetter,
                    style: context.text.displaySmall.copyWith(
                      color: context.colors.onPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 230,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: context.colors.onPrimary),
              borderRadius: BorderRadius.circular(40),
            ),
            child: CupertinoTextField.borderless(
              expands: true,
              minLines: null,
              maxLines: null,
              style: context.text.displaySmall.copyWith(
                color: context.colors.onPrimary,
              ),
              cursorColor: context.colors.onPrimary,
              placeholder: 'Type here',
              placeholderStyle: context.text.displaySmall.copyWith(
                color: context.colors.onPrimary.withOpacity(.5),
              ),
              controller: _stageController,
              onChanged: widget.onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
