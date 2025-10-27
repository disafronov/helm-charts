{{/*
  Common spec: container
*/}}

{{- define "default.common-spec_container" -}}
securityContext:
  {{- toYaml .Values.securityContext | nindent 2 }}
image: "{{ required "A valid image repository is required!" .Values.image.repository }}:{{ default .Chart.AppVersion .Values.image.tag }}"
imagePullPolicy: {{ default "IfNotPresent" .Values.image.pullPolicy }}
{{- include "default.common-spec_container-env" . }}
tty: {{ .Values.tty.enabled }}
{{- end }}
