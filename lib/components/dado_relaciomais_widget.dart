import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dado_relaciomais_model.dart';
export 'dado_relaciomais_model.dart';

class DadoRelaciomaisWidget extends StatefulWidget {
  const DadoRelaciomaisWidget({
    super.key,
    String? tituloDoDropDown,
    this.conteudoDoDropDown,
  }) : this.tituloDoDropDown = tituloDoDropDown ?? 'nuull';

  final String tituloDoDropDown;
  final List<String>? conteudoDoDropDown;

  @override
  State<DadoRelaciomaisWidget> createState() => _DadoRelaciomaisWidgetState();
}

class _DadoRelaciomaisWidgetState extends State<DadoRelaciomaisWidget> {
  late DadoRelaciomaisModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DadoRelaciomaisModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).bordas,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
            child: FaIcon(
              FontAwesomeIcons.angleDown,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
