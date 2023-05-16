{{/*
  Create a default fully qualified headless svc name.
  We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
  If release name contains chart name it will be used as a full name.
*/}}

{{- define "default.svc-headless-name" -}}
{{- if .Values.fullnameOverride }}
{{- printf "%s-hl" (.Values.fullnameOverride | trunc 60 | trimSuffix "-") }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- printf "%s-hl" (.Release.Name | trunc 60 | trimSuffix "-") }}
{{- else }}
{{- printf "%s-hl" (printf "%s-%s" .Release.Name $name | trunc 60 | trimSuffix "-") }}
{{- end }}
{{- end }}
{{- end }}