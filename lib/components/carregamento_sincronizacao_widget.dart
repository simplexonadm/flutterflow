import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'carregamento_sincronizacao_model.dart';
export 'carregamento_sincronizacao_model.dart';

class CarregamentoSincronizacaoWidget extends StatefulWidget {
  const CarregamentoSincronizacaoWidget({
    super.key,
    required this.localDeProducao,
    required this.sincronizacao,
  });

  final DtLocalDeProducaoStruct? localDeProducao;
  final bool? sincronizacao;

  @override
  State<CarregamentoSincronizacaoWidget> createState() =>
      _CarregamentoSincronizacaoWidgetState();
}

class _CarregamentoSincronizacaoWidgetState
    extends State<CarregamentoSincronizacaoWidget> {
  late CarregamentoSincronizacaoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarregamentoSincronizacaoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.sincronizacao == true) {
        // Block - Local de producao
        await action_blocks.getLocalDeproducao(
          context,
          dtLocalDeProducao: widget.localDeProducao,
        );
        safeSetState(() {});
      } else {
        // API - Sincronização
        _model.apiSincronizacao = await PostGroup.sincronizacaoCall.call(
          authorization: currentAuthenticationToken,
          fkLocaldeproducao: valueOrDefault<int>(
            widget.localDeProducao?.id,
            0,
          ),
          itemFormularioJson:
              FFAppState().dtItemFormulario.map((e) => e.toMap()).toList(),
          controleofflineId: FFAppState().dtControleOffline.id,
        );

        if ((_model.apiSincronizacao?.succeeded ?? true)) {
          // Snack - Dados enviados com sucesso!
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Dados enviados com sucesso!',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).primary,
            ),
          );
        } else {
          // Block - Logs
          await action_blocks.logs(
            context,
            body: (_model.apiSincronizacao?.jsonBody ?? '').toString(),
            code: (_model.apiSincronizacao?.statusCode ?? 200),
            local: 'CarregamentoSincronizacao',
            tipoErro: 'API',
            snack: false,
            descricao: 'Erro SINCRONIZAR ENVIO de dados',
            enPrioridade: EnPrioridade.Alta.name,
            funcionalidade: LogFuncionalidade.envioDeDados.name,
          );
        }
      }

      // Dialog - Close
      Navigator.pop(context);
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Lottie.asset(
                'assets/jsons/Animation_-_1699301539629_(1).json',
                width: MediaQuery.sizeOf(context).width * 0.8,
                height: MediaQuery.sizeOf(context).height * 0.5,
                fit: BoxFit.contain,
                animate: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
