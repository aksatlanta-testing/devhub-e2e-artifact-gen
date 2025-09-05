
{{- define "go-echo93338edc-eb3b-407f-958e-40d986475c72.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo93338edc-eb3b-407f-958e-40d986475c72.fullname" -}}
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


{{- define "go-echo93338edc-eb3b-407f-958e-40d986475c72.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo93338edc-eb3b-407f-958e-40d986475c72.labels" -}}
helm.sh/chart: {{ include "go-echo93338edc-eb3b-407f-958e-40d986475c72.chart" . }}
{{ include "go-echo93338edc-eb3b-407f-958e-40d986475c72.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo93338edc-eb3b-407f-958e-40d986475c72.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo93338edc-eb3b-407f-958e-40d986475c72.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}