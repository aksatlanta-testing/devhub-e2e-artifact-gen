
{{- define "go-echod5acba82-1b45-4a21-8882-80d978edb45e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5acba82-1b45-4a21-8882-80d978edb45e.fullname" -}}
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


{{- define "go-echod5acba82-1b45-4a21-8882-80d978edb45e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5acba82-1b45-4a21-8882-80d978edb45e.labels" -}}
helm.sh/chart: {{ include "go-echod5acba82-1b45-4a21-8882-80d978edb45e.chart" . }}
{{ include "go-echod5acba82-1b45-4a21-8882-80d978edb45e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod5acba82-1b45-4a21-8882-80d978edb45e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod5acba82-1b45-4a21-8882-80d978edb45e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}