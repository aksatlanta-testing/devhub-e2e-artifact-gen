
{{- define "go-echoa3318270-74ca-4c04-800f-fbc8518c3f3c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa3318270-74ca-4c04-800f-fbc8518c3f3c.fullname" -}}
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


{{- define "go-echoa3318270-74ca-4c04-800f-fbc8518c3f3c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa3318270-74ca-4c04-800f-fbc8518c3f3c.labels" -}}
helm.sh/chart: {{ include "go-echoa3318270-74ca-4c04-800f-fbc8518c3f3c.chart" . }}
{{ include "go-echoa3318270-74ca-4c04-800f-fbc8518c3f3c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa3318270-74ca-4c04-800f-fbc8518c3f3c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa3318270-74ca-4c04-800f-fbc8518c3f3c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}