
{{- define "go-echod3d4c934-5ae7-4e08-bdbb-f0b54b082d44.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod3d4c934-5ae7-4e08-bdbb-f0b54b082d44.fullname" -}}
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


{{- define "go-echod3d4c934-5ae7-4e08-bdbb-f0b54b082d44.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod3d4c934-5ae7-4e08-bdbb-f0b54b082d44.labels" -}}
helm.sh/chart: {{ include "go-echod3d4c934-5ae7-4e08-bdbb-f0b54b082d44.chart" . }}
{{ include "go-echod3d4c934-5ae7-4e08-bdbb-f0b54b082d44.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod3d4c934-5ae7-4e08-bdbb-f0b54b082d44.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod3d4c934-5ae7-4e08-bdbb-f0b54b082d44.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}