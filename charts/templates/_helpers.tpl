
{{- define "go-echoaf34dcec-fdca-461f-9d89-23cfe73dd395.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf34dcec-fdca-461f-9d89-23cfe73dd395.fullname" -}}
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


{{- define "go-echoaf34dcec-fdca-461f-9d89-23cfe73dd395.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf34dcec-fdca-461f-9d89-23cfe73dd395.labels" -}}
helm.sh/chart: {{ include "go-echoaf34dcec-fdca-461f-9d89-23cfe73dd395.chart" . }}
{{ include "go-echoaf34dcec-fdca-461f-9d89-23cfe73dd395.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaf34dcec-fdca-461f-9d89-23cfe73dd395.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaf34dcec-fdca-461f-9d89-23cfe73dd395.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}