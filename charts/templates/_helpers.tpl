
{{- define "go-echoae48a29b-86ed-4cf2-b43e-a3f23828aeb0.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae48a29b-86ed-4cf2-b43e-a3f23828aeb0.fullname" -}}
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


{{- define "go-echoae48a29b-86ed-4cf2-b43e-a3f23828aeb0.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae48a29b-86ed-4cf2-b43e-a3f23828aeb0.labels" -}}
helm.sh/chart: {{ include "go-echoae48a29b-86ed-4cf2-b43e-a3f23828aeb0.chart" . }}
{{ include "go-echoae48a29b-86ed-4cf2-b43e-a3f23828aeb0.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoae48a29b-86ed-4cf2-b43e-a3f23828aeb0.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoae48a29b-86ed-4cf2-b43e-a3f23828aeb0.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}