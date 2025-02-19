
{{- define "go-echo0148a5f0-820e-49eb-8459-6f60b01c84af.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0148a5f0-820e-49eb-8459-6f60b01c84af.fullname" -}}
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


{{- define "go-echo0148a5f0-820e-49eb-8459-6f60b01c84af.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0148a5f0-820e-49eb-8459-6f60b01c84af.labels" -}}
helm.sh/chart: {{ include "go-echo0148a5f0-820e-49eb-8459-6f60b01c84af.chart" . }}
{{ include "go-echo0148a5f0-820e-49eb-8459-6f60b01c84af.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0148a5f0-820e-49eb-8459-6f60b01c84af.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0148a5f0-820e-49eb-8459-6f60b01c84af.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}