import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'teste_model.dart';
export 'teste_model.dart';

class TesteWidget extends StatefulWidget {
  const TesteWidget({super.key});

  static String routeName = 'teste';
  static String routePath = '/teste';

  @override
  State<TesteWidget> createState() => _TesteWidgetState();
}

class _TesteWidgetState extends State<TesteWidget> {
  late TesteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TesteModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowWebView(
                content:
                    '<!DOCTYPE html>\n<html>\n<head>\n    <title>Formulário</title>\n    <script src=\"https://cdn.jsdelivr.net/npm/chart.js\"></script>\n    <style>\n        body { font-family: Arial, sans-serif; }\n        .chart-container { width: 400px; height: 400px; margin: auto; }\n        h2 { text-align: center; color: #333; }\n    </style>\n</head>\n<body>\n    <h2>Resultados do Formulário</h2>\n    <div class=\"chart-container\">\n        <canvas id=\"myChart\"></canvas>\n    </div>\n    <script>\n        const ctx = document.getElementById(\'myChart\').getContext(\'2d\');\n        const myChart = new Chart(ctx, {\n            type: \'doughnut\',\n            data: {\n                labels: [\"Conforme\",\"Não Conforme\",\"Não Aplicável\",\"Em Aberto\"],\n                datasets: [{\n                    label: \'Formulários\',\n                    data: [2,2,1,5],\n                    backgroundColor: [\"rgba(0, 255, 0, 0.7)\",\"rgba(255, 0, 0, 0.7)\",\"rgba(255, 255, 0, 0.7)\",\"rgba(220, 220, 220, 0.7)\"],\n                    borderColor: [\"rgb(0, 255, 0)\",\"rgb(255, 0, 0)\",\"rgb(255, 255, 0)\",\"rgb(220, 220, 220)\"],\n                    borderWidth: 1,\n                    hoverOffset: 20 // Use the hoverOffset from chartData\n                }]\n            },\n            options: {\n                responsive: true,\n                maintainAspectRatio: false,\n                plugins: {\n                    legend: {\n                        position: \'bottom\',\n                    },\n                    title: {\n                        display: true,\n                        text: \'Distribuição dos Formulários\',\n                        padding: 20\n                    }\n                },\n                animation: {\n                    animateRotate: true,\n                    animateScale: true\n                }\n            }\n        });\n    </script>\n</body>\n</html>\n',
                height: 500.0,
                verticalScroll: false,
                horizontalScroll: false,
                html: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
