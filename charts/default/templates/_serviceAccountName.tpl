{{/*
  Create the name of the service account to use
*/}}

{{- define "default.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "default.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
