
{{- define "go-echof51e8cfb-4ae1-49e9-bbf4-cbcd23696de3.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof51e8cfb-4ae1-49e9-bbf4-cbcd23696de3.fullname" -}}
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


{{- define "go-echof51e8cfb-4ae1-49e9-bbf4-cbcd23696de3.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof51e8cfb-4ae1-49e9-bbf4-cbcd23696de3.labels" -}}
helm.sh/chart: {{ include "go-echof51e8cfb-4ae1-49e9-bbf4-cbcd23696de3.chart" . }}
{{ include "go-echof51e8cfb-4ae1-49e9-bbf4-cbcd23696de3.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof51e8cfb-4ae1-49e9-bbf4-cbcd23696de3.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof51e8cfb-4ae1-49e9-bbf4-cbcd23696de3.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}