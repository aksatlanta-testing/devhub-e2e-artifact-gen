
{{- define "go-echoab3dcfd2-2f36-4200-a170-edb836824b1c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab3dcfd2-2f36-4200-a170-edb836824b1c.fullname" -}}
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


{{- define "go-echoab3dcfd2-2f36-4200-a170-edb836824b1c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab3dcfd2-2f36-4200-a170-edb836824b1c.labels" -}}
helm.sh/chart: {{ include "go-echoab3dcfd2-2f36-4200-a170-edb836824b1c.chart" . }}
{{ include "go-echoab3dcfd2-2f36-4200-a170-edb836824b1c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoab3dcfd2-2f36-4200-a170-edb836824b1c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoab3dcfd2-2f36-4200-a170-edb836824b1c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}