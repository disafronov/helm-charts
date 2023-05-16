{{/*
  Selector labels
*/}}

{{- define "default.selectorLabels" -}}
app.kubernetes.io/name: {{ include "default.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
