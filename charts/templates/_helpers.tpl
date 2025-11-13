
{{- define "go-echoecc137e1-81f5-4340-8276-aa383eeca5e7.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoecc137e1-81f5-4340-8276-aa383eeca5e7.fullname" -}}
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


{{- define "go-echoecc137e1-81f5-4340-8276-aa383eeca5e7.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoecc137e1-81f5-4340-8276-aa383eeca5e7.labels" -}}
helm.sh/chart: {{ include "go-echoecc137e1-81f5-4340-8276-aa383eeca5e7.chart" . }}
{{ include "go-echoecc137e1-81f5-4340-8276-aa383eeca5e7.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoecc137e1-81f5-4340-8276-aa383eeca5e7.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoecc137e1-81f5-4340-8276-aa383eeca5e7.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}