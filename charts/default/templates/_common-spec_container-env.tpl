{{/*
  Common spec: container
*/}}

{{- define "default.common-spec_container-env" -}}
{{- if .Values.env }}
env:
{{- range $field, $env := .Values.env }}
{{- $name := $field }}
{{- if and (kindIs "map" $env) (hasKey $env "name") }}
  {{- $name = $env.name }}
{{- end }}
  - name: {{ $name }}
{{- if (kindIs "string" $env) }}
    value: {{ $env | quote }}
{{- else if (kindIs "map" $env) }}
    valueFrom: {{ $env | toYaml | nindent 6 }}
{{- else }}
    value: ""
{{- end }}
{{- end }}
{{- end }}
{{- end }}
