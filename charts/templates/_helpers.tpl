
{{- define "go-echo9b6291c2-77fe-418c-b1b0-94845e3d11bf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9b6291c2-77fe-418c-b1b0-94845e3d11bf.fullname" -}}
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


{{- define "go-echo9b6291c2-77fe-418c-b1b0-94845e3d11bf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9b6291c2-77fe-418c-b1b0-94845e3d11bf.labels" -}}
helm.sh/chart: {{ include "go-echo9b6291c2-77fe-418c-b1b0-94845e3d11bf.chart" . }}
{{ include "go-echo9b6291c2-77fe-418c-b1b0-94845e3d11bf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9b6291c2-77fe-418c-b1b0-94845e3d11bf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9b6291c2-77fe-418c-b1b0-94845e3d11bf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}