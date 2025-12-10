
{{- define "go-echo4310ffcc-fd37-4123-8755-a8b024e80330.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4310ffcc-fd37-4123-8755-a8b024e80330.fullname" -}}
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


{{- define "go-echo4310ffcc-fd37-4123-8755-a8b024e80330.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4310ffcc-fd37-4123-8755-a8b024e80330.labels" -}}
helm.sh/chart: {{ include "go-echo4310ffcc-fd37-4123-8755-a8b024e80330.chart" . }}
{{ include "go-echo4310ffcc-fd37-4123-8755-a8b024e80330.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4310ffcc-fd37-4123-8755-a8b024e80330.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4310ffcc-fd37-4123-8755-a8b024e80330.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}