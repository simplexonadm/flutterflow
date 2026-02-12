import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'input_datac_model.dart';
export 'input_datac_model.dart';

class InputDatacWidget extends StatefulWidget {
  const InputDatacWidget({
    super.key,
    this.parameter1,
    required this.data0,
  });

  final String? parameter1;
  final Future Function()? data0;

  @override
  State<InputDatacWidget> createState() => _InputDatacWidgetState();
}

class _InputDatacWidgetState extends State<InputDatacWidget> {
  late InputDatacModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InputDatacModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        // Pick - Data prevista
        final _datePickedDate = await showDatePicker(
          context: context,
          initialDate: getCurrentTimestamp,
          firstDate: getCurrentTimestamp,
          lastDate: DateTime(2050),
          builder: (context, child) {
            return wrapInMaterialDatePickerTheme(
              context,
              child!,
              headerBackgroundColor: FlutterFlowTheme.of(context).primary,
              headerForegroundColor: FlutterFlowTheme.of(context).info,
              headerTextStyle: FlutterFlowTheme.of(context)
                  .headlineLarge
                  .override(
                    font: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                    ),
                    fontSize: 32.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                  ),
              pickerBackgroundColor:
                  FlutterFlowTheme.of(context).secondaryBackground,
              pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
              selectedDateTimeBackgroundColor:
                  FlutterFlowTheme.of(context).primary,
              selectedDateTimeForegroundColor:
                  FlutterFlowTheme.of(context).info,
              actionButtonForegroundColor:
                  FlutterFlowTheme.of(context).primaryText,
              iconSize: 24.0,
            );
          },
        );

        TimeOfDay? _datePickedTime;
        if (_datePickedDate != null) {
          _datePickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(getCurrentTimestamp),
            builder: (context, child) {
              return wrapInMaterialTimePickerTheme(
                context,
                child!,
                headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                headerForegroundColor: FlutterFlowTheme.of(context).info,
                headerTextStyle: FlutterFlowTheme.of(context)
                    .headlineLarge
                    .override(
                      font: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineLarge
                            .fontStyle,
                      ),
                      fontSize: 32.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                    ),
                pickerBackgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                selectedDateTimeBackgroundColor:
                    FlutterFlowTheme.of(context).primary,
                selectedDateTimeForegroundColor:
                    FlutterFlowTheme.of(context).info,
                actionButtonForegroundColor:
                    FlutterFlowTheme.of(context).primaryText,
                iconSize: 24.0,
              );
            },
          );
        }

        if (_datePickedDate != null && _datePickedTime != null) {
          safeSetState(() {
            _model.datePicked = DateTime(
              _datePickedDate.year,
              _datePickedDate.month,
              _datePickedDate.day,
              _datePickedTime!.hour,
              _datePickedTime.minute,
            );
          });
        } else if (_model.datePicked != null) {
          safeSetState(() {
            _model.datePicked = getCurrentTimestamp;
          });
        }
        await widget.data0?.call();
      },
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          color: Color(0xFFFCFCFC),
          borderRadius: BorderRadius.circular(10.0),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Color(0xFFD6D6D6),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
              child: Text(
                widget.parameter1!,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.montserrat(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      lineHeight: 3.0,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
              child: Icon(
                Icons.date_range,
                color: FlutterFlowTheme.of(context).primary,
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
