
{{- define "go-echodce41d5b-87bb-4ba2-b1b3-e0620a5d529e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodce41d5b-87bb-4ba2-b1b3-e0620a5d529e.fullname" -}}
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


{{- define "go-echodce41d5b-87bb-4ba2-b1b3-e0620a5d529e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodce41d5b-87bb-4ba2-b1b3-e0620a5d529e.labels" -}}
helm.sh/chart: {{ include "go-echodce41d5b-87bb-4ba2-b1b3-e0620a5d529e.chart" . }}
{{ include "go-echodce41d5b-87bb-4ba2-b1b3-e0620a5d529e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodce41d5b-87bb-4ba2-b1b3-e0620a5d529e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodce41d5b-87bb-4ba2-b1b3-e0620a5d529e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}