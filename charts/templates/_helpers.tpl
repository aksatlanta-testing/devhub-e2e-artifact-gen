
{{- define "go-echo975f34dd-02a0-48d1-ae8c-d1a18e0c28be.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo975f34dd-02a0-48d1-ae8c-d1a18e0c28be.fullname" -}}
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


{{- define "go-echo975f34dd-02a0-48d1-ae8c-d1a18e0c28be.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo975f34dd-02a0-48d1-ae8c-d1a18e0c28be.labels" -}}
helm.sh/chart: {{ include "go-echo975f34dd-02a0-48d1-ae8c-d1a18e0c28be.chart" . }}
{{ include "go-echo975f34dd-02a0-48d1-ae8c-d1a18e0c28be.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo975f34dd-02a0-48d1-ae8c-d1a18e0c28be.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo975f34dd-02a0-48d1-ae8c-d1a18e0c28be.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}