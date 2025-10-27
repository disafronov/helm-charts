{{/*
  Common spec: container for deployments (includes base + command/args + ports + probes)
*/}}

{{- define "default.common-spec_container_deployments" -}}
{{- include "default.common-spec_container" . }}
resources:
  {{- toYaml .Values.resources | nindent 2 }}
{{- with .Values.command }}
command:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- with .Values.args }}
args:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- include "default.common-spec_container-ports" . }}
{{- include "default.common-spec_container-probes" . }}
{{- end }}
