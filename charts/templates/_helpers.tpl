
{{- define "go-echo61fa84f3-b80c-44be-8b96-54cf3aff89ef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo61fa84f3-b80c-44be-8b96-54cf3aff89ef.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo61fa84f3-b80c-44be-8b96-54cf3aff89ef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo61fa84f3-b80c-44be-8b96-54cf3aff89ef.labels" -}}
helm.sh/chart: {{ include "go-echo61fa84f3-b80c-44be-8b96-54cf3aff89ef.chart" . }}
{{ include "go-echo61fa84f3-b80c-44be-8b96-54cf3aff89ef.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo61fa84f3-b80c-44be-8b96-54cf3aff89ef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo61fa84f3-b80c-44be-8b96-54cf3aff89ef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}