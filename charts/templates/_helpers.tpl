
{{- define "go-echoab97fcbb-0217-4006-a3a9-e8764e4fc496.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab97fcbb-0217-4006-a3a9-e8764e4fc496.fullname" -}}
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


{{- define "go-echoab97fcbb-0217-4006-a3a9-e8764e4fc496.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab97fcbb-0217-4006-a3a9-e8764e4fc496.labels" -}}
helm.sh/chart: {{ include "go-echoab97fcbb-0217-4006-a3a9-e8764e4fc496.chart" . }}
{{ include "go-echoab97fcbb-0217-4006-a3a9-e8764e4fc496.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoab97fcbb-0217-4006-a3a9-e8764e4fc496.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoab97fcbb-0217-4006-a3a9-e8764e4fc496.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}