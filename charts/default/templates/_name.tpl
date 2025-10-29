{{/*
  Expand the name of the chart.
*/}}

{{- define "default.name" -}}
{{- default .Chart.Name .Values.nameOverride | lower | replace "_" "-" | replace "." "-" | trunc 63 | trimSuffix "-" }}
{{- end }}
