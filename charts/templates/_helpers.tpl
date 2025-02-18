
{{- define "go-echo78c9740d-c45e-4ade-b8b9-c97202f83357.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo78c9740d-c45e-4ade-b8b9-c97202f83357.fullname" -}}
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


{{- define "go-echo78c9740d-c45e-4ade-b8b9-c97202f83357.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo78c9740d-c45e-4ade-b8b9-c97202f83357.labels" -}}
helm.sh/chart: {{ include "go-echo78c9740d-c45e-4ade-b8b9-c97202f83357.chart" . }}
{{ include "go-echo78c9740d-c45e-4ade-b8b9-c97202f83357.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo78c9740d-c45e-4ade-b8b9-c97202f83357.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo78c9740d-c45e-4ade-b8b9-c97202f83357.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}