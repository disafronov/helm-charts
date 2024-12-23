{{/*
  Common spec: container-probes
*/}}

{{- define "default.common-spec_container-probes" -}}
{{- if and (not .Values.startupProbe) .Values.containerPort (ne .Values.containerPortProtocol "UDP") }}
startupProbe:
  tcpSocket:
    port: default
  initialDelaySeconds: 10
  failureThreshold: 29
{{- end }}
{{- with .Values.startupProbe }}
startupProbe:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- if and (not .Values.livenessProbe) .Values.containerPort (not .Values.containerPortProtocol) }}
livenessProbe:
  httpGet:
    path: /
    port: default
  timeoutSeconds: 3
{{- end }}
{{- if and (not .Values.livenessProbe) .Values.containerPort (eq .Values.containerPortProtocol "TCP") }}
livenessProbe:
  tcpSocket:
    port: default
  timeoutSeconds: 3
{{- end }}
{{- with .Values.livenessProbe }}
livenessProbe:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- if and (not .Values.readinessProbe) .Values.containerPort (not .Values.containerPortProtocol) }}
readinessProbe:
  httpGet:
    path: /
    port: default
  periodSeconds: 3
{{- end }}
{{- if and (not .Values.readinessProbe) .Values.containerPort (eq .Values.containerPortProtocol "TCP") }}
readinessProbe:
  tcpSocket:
    port: default
  periodSeconds: 3
{{- end }}
{{- with .Values.readinessProbe }}
readinessProbe:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- end }}
