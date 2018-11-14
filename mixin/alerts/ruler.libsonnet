{
  prometheusAlerts+:: {
    groups+: [
      {
        name: 'thanos-ruler',
        rules: [
          {
            alert: 'ThanosRuleIsDroppingAlerts',
            expr: |||
              rate(thanos_alert_queue_alerts_dropped_total{%(thanosRulerSelector)s}[5m]) > 0
            ||| % $._config,
            'for': '5m',
            labels: {
              severity: 'warning',
            },
            annotations: {
              message: 'Thanos Rule is dropping alerts. Alerts are not working.',
            },
          },
          {
            alert: 'ThanosRuleGrpcErrorRate',
            expr: |||
              rate(grpc_server_handled_total{grpc_code=~"Unknown|ResourceExhausted|Internal|Unavailable",%(thanosRulerSelector)s}[5m]) > 0
            ||| % $._config,
            'for': '5m',
            labels: {
              severity: 'warning',
            },
            annotations: {
              message: 'Thanos Rule is returning Internal/Unavailable errors. Recording Rules are not working.',
            },
          },
        ],
      },
    ],
  },
}
