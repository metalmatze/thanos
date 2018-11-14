{
  prometheusAlerts+:: {
    groups+: [
      {
        name: 'thanos-compaction',
        rules: [
          {
            alert: 'ThanosCompactHalted',
            expr: |||
              thanos_compactor_halted{%(thanosCompactorSelector)s} == 1
            ||| % $._config,
            'for': '5m',
            labels: {
              severity: 'warning',
            },
            annotations: {
              message: 'Thanos compaction has failed to run and now is halted.',
            },
          },
          {
            alert: 'ThanosCompactCompactionsFailed',
            expr: |||
              rate(prometheus_tsdb_compactions_failed_total{%(thanosCompactorSelector)s}[5m]) > 0
            ||| % $._config,
            'for': '5m',
            labels: {
              severity: 'warning',
            },
            annotations: {
              message: 'Thanos Compact is failing compaction. Long term storage queries will be slower.',
            },
          },
          {
            alert: 'ThanosCompactBucketOperationsFailed',
            expr: |||
              rate(thanos_objstore_bucket_operation_failures_total{%(thanosCompactorSelector)s}[5m]) > 0
            ||| % $._config,
            'for': '5m',
            labels: {
              severity: 'warning',
            },
            annotations: {
              message: 'Thanos Compact bucket operations are failing. Long term storage queries will be slower.',
            },
          },
          {
            alert: 'ThanosCompactNotRunIn24Hours',
            expr: |||
              (time() - max(thanos_objstore_bucket_last_successful_upload_time{%(thanosCompactorSelector)s}) ) / 60/60 > 24
            ||| % $._config,
            labels: {
              severity: 'critical',
            },
            annotations: {
              message: 'Thanos Compact bucket operations are failing. Long term storage queries will be slower.',
            },
          },
          {
            alert: 'ThanosComactionMultipleCompactionsAreRunning',
            expr: |||
              sum(up{app="thanos-compact"}) > 1
            ||| % $._config,
            'for': '5m',
            labels: {
              severity: 'warning',
            },
            annotations: {
              message: 'Multiple replicas of Thanos compaction should not be running at the same time. Metrics in long term storage may be corrupted.',
            },
          },
        ],
      },
    ],
  },
}
