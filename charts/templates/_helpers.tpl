
{{- define "go-echoc1f607bd-13fb-4714-a4fe-e90a119ce1ab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc1f607bd-13fb-4714-a4fe-e90a119ce1ab.fullname" -}}
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


{{- define "go-echoc1f607bd-13fb-4714-a4fe-e90a119ce1ab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc1f607bd-13fb-4714-a4fe-e90a119ce1ab.labels" -}}
helm.sh/chart: {{ include "go-echoc1f607bd-13fb-4714-a4fe-e90a119ce1ab.chart" . }}
{{ include "go-echoc1f607bd-13fb-4714-a4fe-e90a119ce1ab.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc1f607bd-13fb-4714-a4fe-e90a119ce1ab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc1f607bd-13fb-4714-a4fe-e90a119ce1ab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}