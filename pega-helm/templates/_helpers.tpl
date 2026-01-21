{{/*
Return the name of the chart
*/}}
{{- define "pega-customer.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Return the full name (with optional release name)
*/}}
{{- define "pega-customer.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name (include "pega-customer.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end }}
