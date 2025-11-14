
{{- define "go-echoe3d3b4db-4a44-4a20-ab34-ddc14bb64667.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe3d3b4db-4a44-4a20-ab34-ddc14bb64667.fullname" -}}
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


{{- define "go-echoe3d3b4db-4a44-4a20-ab34-ddc14bb64667.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe3d3b4db-4a44-4a20-ab34-ddc14bb64667.labels" -}}
helm.sh/chart: {{ include "go-echoe3d3b4db-4a44-4a20-ab34-ddc14bb64667.chart" . }}
{{ include "go-echoe3d3b4db-4a44-4a20-ab34-ddc14bb64667.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe3d3b4db-4a44-4a20-ab34-ddc14bb64667.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe3d3b4db-4a44-4a20-ab34-ddc14bb64667.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}