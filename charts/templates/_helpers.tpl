
{{- define "go-echo7d932a96-e823-486d-a938-c910521eacdf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7d932a96-e823-486d-a938-c910521eacdf.fullname" -}}
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


{{- define "go-echo7d932a96-e823-486d-a938-c910521eacdf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7d932a96-e823-486d-a938-c910521eacdf.labels" -}}
helm.sh/chart: {{ include "go-echo7d932a96-e823-486d-a938-c910521eacdf.chart" . }}
{{ include "go-echo7d932a96-e823-486d-a938-c910521eacdf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7d932a96-e823-486d-a938-c910521eacdf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7d932a96-e823-486d-a938-c910521eacdf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}