
{{- define "go-echoa20ef16b-924a-4726-a2c2-24a12a174edf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa20ef16b-924a-4726-a2c2-24a12a174edf.fullname" -}}
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


{{- define "go-echoa20ef16b-924a-4726-a2c2-24a12a174edf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa20ef16b-924a-4726-a2c2-24a12a174edf.labels" -}}
helm.sh/chart: {{ include "go-echoa20ef16b-924a-4726-a2c2-24a12a174edf.chart" . }}
{{ include "go-echoa20ef16b-924a-4726-a2c2-24a12a174edf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa20ef16b-924a-4726-a2c2-24a12a174edf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa20ef16b-924a-4726-a2c2-24a12a174edf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}