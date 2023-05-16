{{/*
  Common labels
*/}}

{{- define "default.labels" -}}
helm.sh/chart: {{ include "default.chart" . }}
{{ include "default.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
