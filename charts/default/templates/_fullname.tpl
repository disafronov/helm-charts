{{/*
  Create a default fully qualified app name.
  We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
  If release name contains chart name it will be used as a full name.
*/}}

{{- define "default.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | lower | replace "_" "-" | replace "." "-" | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $baseName := default .Chart.Name .Values.nameOverride | lower | replace "_" "-" | replace "." "-" }}
{{- $releaseName := .Release.Name | lower | replace "_" "-" | replace "." "-" }}
{{- if contains $baseName $releaseName }}
{{- $releaseName | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" $releaseName $baseName | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}
