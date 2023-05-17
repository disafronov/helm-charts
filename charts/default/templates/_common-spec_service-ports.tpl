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
    protocol: {{ default "TCP" .Values.containerPortProtocol }}
    name: default
{{- end }}
{{- if .Values.ports }}
{{- range $k, $v := .Values.ports }}
  - port: {{ $k | trim }}
    targetPort: {{ $k | trim }}
    protocol: {{ default "TCP" $v | trim }}
    name: default-{{ $k | trim }}-{{ default "TCP" $v | trim }}
{{- end }}
{{- end }}
{{- end }}
