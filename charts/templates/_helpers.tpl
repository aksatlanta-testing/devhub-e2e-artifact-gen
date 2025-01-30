
{{- define "go-echo5727fc25-fa05-4c1f-b8cb-23a21d3524db.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5727fc25-fa05-4c1f-b8cb-23a21d3524db.fullname" -}}
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


{{- define "go-echo5727fc25-fa05-4c1f-b8cb-23a21d3524db.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5727fc25-fa05-4c1f-b8cb-23a21d3524db.labels" -}}
helm.sh/chart: {{ include "go-echo5727fc25-fa05-4c1f-b8cb-23a21d3524db.chart" . }}
{{ include "go-echo5727fc25-fa05-4c1f-b8cb-23a21d3524db.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5727fc25-fa05-4c1f-b8cb-23a21d3524db.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5727fc25-fa05-4c1f-b8cb-23a21d3524db.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}