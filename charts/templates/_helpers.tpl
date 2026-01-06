
{{- define "go-echoee3bfc74-00c2-436b-a17e-9ed8a27fcc71.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee3bfc74-00c2-436b-a17e-9ed8a27fcc71.fullname" -}}
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


{{- define "go-echoee3bfc74-00c2-436b-a17e-9ed8a27fcc71.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee3bfc74-00c2-436b-a17e-9ed8a27fcc71.labels" -}}
helm.sh/chart: {{ include "go-echoee3bfc74-00c2-436b-a17e-9ed8a27fcc71.chart" . }}
{{ include "go-echoee3bfc74-00c2-436b-a17e-9ed8a27fcc71.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoee3bfc74-00c2-436b-a17e-9ed8a27fcc71.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoee3bfc74-00c2-436b-a17e-9ed8a27fcc71.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}