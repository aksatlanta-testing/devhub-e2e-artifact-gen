
{{- define "go-echo3a8802e0-c25c-417d-af49-fd4b6f3c721f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3a8802e0-c25c-417d-af49-fd4b6f3c721f.fullname" -}}
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


{{- define "go-echo3a8802e0-c25c-417d-af49-fd4b6f3c721f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3a8802e0-c25c-417d-af49-fd4b6f3c721f.labels" -}}
helm.sh/chart: {{ include "go-echo3a8802e0-c25c-417d-af49-fd4b6f3c721f.chart" . }}
{{ include "go-echo3a8802e0-c25c-417d-af49-fd4b6f3c721f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3a8802e0-c25c-417d-af49-fd4b6f3c721f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3a8802e0-c25c-417d-af49-fd4b6f3c721f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}