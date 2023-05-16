{{/*
  Common spec: pod
*/}}

{{- define "default.common-spec_pod" -}}
selector:
  matchLabels:
    {{- include "default.selectorLabels" . | nindent 4 }}
template:
  metadata:
    {{- with .Values.podAnnotations }}
    annotations:
      {{- toYaml . | nindent 6 }}
    {{- end }}
    labels:
      {{- include "default.selectorLabels" . | nindent 6 }}
  spec:
    serviceAccountName: {{ include "default.serviceAccountName" . }}
    securityContext:
      {{- toYaml .Values.podSecurityContext | nindent 6 }}
    {{- with .Values.imagePullSecrets }}
    imagePullSecrets:
      {{- toYaml . | nindent 6 }}
    {{- end }}
    {{- with .Values.initContainers }}
    initContainers:
      {{- toYaml . | nindent 6 }}
    {{- end }}
    {{- with .Values.nodeSelector }}
    nodeSelector:
      {{- toYaml . | nindent 6 }}
    {{- end }}
    {{- with .Values.affinity }}
    affinity:
      {{- toYaml . | nindent 6 }}
    {{- end }}
    {{- with .Values.tolerations }}
    tolerations:
      {{- toYaml . | nindent 6 }}
    {{- end }}
{{- end }}
