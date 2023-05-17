{{/*
  Common spec: container-ports
*/}}

{{- define "default.common-spec_container-ports" -}}
{{- if or .Values.containerPort .Values.ports }}
ports:
{{- if .Values.containerPort }}
  - name: default
    containerPort: {{ .Values.containerPort }}
    protocol: {{ default "TCP" .Values.containerPortProtocol | trim | upper }}
{{- end }}
{{- if .Values.ports }}
{{- range $k, $v := .Values.ports }}
  - containerPort: {{ $k | trim | lower }}
    protocol: {{ default "TCP" $v | trim | upper }}
{{- end }}
{{- end }}
{{- end }}
{{- end }}
