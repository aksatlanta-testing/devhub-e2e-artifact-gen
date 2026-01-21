
{{- define "go-echoe8ef42a4-1b48-4d2f-a086-f070013afb23.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe8ef42a4-1b48-4d2f-a086-f070013afb23.fullname" -}}
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


{{- define "go-echoe8ef42a4-1b48-4d2f-a086-f070013afb23.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe8ef42a4-1b48-4d2f-a086-f070013afb23.labels" -}}
helm.sh/chart: {{ include "go-echoe8ef42a4-1b48-4d2f-a086-f070013afb23.chart" . }}
{{ include "go-echoe8ef42a4-1b48-4d2f-a086-f070013afb23.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe8ef42a4-1b48-4d2f-a086-f070013afb23.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe8ef42a4-1b48-4d2f-a086-f070013afb23.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}