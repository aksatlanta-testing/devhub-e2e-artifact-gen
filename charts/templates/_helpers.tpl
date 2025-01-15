
{{- define "go-echo3b24b076-bbb1-4ec9-a8ab-e06db77e9152.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3b24b076-bbb1-4ec9-a8ab-e06db77e9152.fullname" -}}
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


{{- define "go-echo3b24b076-bbb1-4ec9-a8ab-e06db77e9152.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3b24b076-bbb1-4ec9-a8ab-e06db77e9152.labels" -}}
helm.sh/chart: {{ include "go-echo3b24b076-bbb1-4ec9-a8ab-e06db77e9152.chart" . }}
{{ include "go-echo3b24b076-bbb1-4ec9-a8ab-e06db77e9152.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3b24b076-bbb1-4ec9-a8ab-e06db77e9152.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3b24b076-bbb1-4ec9-a8ab-e06db77e9152.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}