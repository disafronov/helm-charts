{{/*
  CronJob name.
*/}}

{{- define "default.cronjob-name" -}}
{{- printf "%s-cronjob" (default .Chart.Name .Values.nameOverride | trunc 48 | trimSuffix "-") }}
{{- end }}

