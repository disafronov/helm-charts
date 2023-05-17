{{/*
  Common spec: service-ports
*/}}

{{- define "default.common-spec_service-ports" -}}
{{- $service := default dict .Values.service -}}
{{- $svcPort := default 80 $service.port -}}
ports:
{{- if .Values.containerPort }}
  - port: {{ $svcPort }}
    targetPort: default
    protocol: {{ default "TCP" .Values.containerPortProtocol | trim | upper }}
    name: default
{{- end }}
{{- if .Values.ports }}
{{- range $k, $v := .Values.ports }}
  - port: {{ $k | trim | lower }}
    targetPort: {{ $k | trim | lower }}
    protocol: {{ default "TCP" $v | trim | upper }}
    name: {{ $k | trim | lower }}-{{ default "TCP" $v | trim | lower }}
{{- end }}
{{- end }}
{{- end }}
