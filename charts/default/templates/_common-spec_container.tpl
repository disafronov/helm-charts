{{/*
  Common spec: container
*/}}

{{- define "default.common-spec_container" -}}
securityContext:
  {{- toYaml .Values.securityContext | nindent 2 }}
resources:
  {{- toYaml .Values.resources | nindent 2 }}
image: "{{ required "A valid image repository is required!" .Values.image.repository }}:{{ default .Chart.AppVersion .Values.image.tag }}"
imagePullPolicy: {{ default "IfNotPresent" .Values.image.pullPolicy }}
{{- with .Values.command }}
command:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- with .Values.args }}
args:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- include "default.common-spec_container-env" . }}
{{- include "default.common-spec_container-ports" . }}
{{- include "default.common-spec_container-probes" . }}
tty: {{ .Values.tty.enabled }}
{{- end }}
