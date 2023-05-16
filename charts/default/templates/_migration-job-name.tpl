{{/*
  Migration job name.
*/}}

{{- define "default.migration-job-name" -}}
{{- printf "%s-migration" (default .Chart.Name .Values.nameOverride | trunc 53 | trimSuffix "-") }}
{{- end }}
