{{/*
  Common spec: container
*/}}

{{- define "default.common-spec_container-env" -}}
{{- if .Values.env }}
env:
{{- range $k, $v := .Values.env }}
  - name: {{ $k | trim }}
    value: {{ $v | trim | quote }}
{{- end }}
{{- end }}
{{- end }}
