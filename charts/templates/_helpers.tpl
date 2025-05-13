
{{- define "go-echoe57dd2f3-755e-4ab9-ad47-d08ab86da270.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe57dd2f3-755e-4ab9-ad47-d08ab86da270.fullname" -}}
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


{{- define "go-echoe57dd2f3-755e-4ab9-ad47-d08ab86da270.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe57dd2f3-755e-4ab9-ad47-d08ab86da270.labels" -}}
helm.sh/chart: {{ include "go-echoe57dd2f3-755e-4ab9-ad47-d08ab86da270.chart" . }}
{{ include "go-echoe57dd2f3-755e-4ab9-ad47-d08ab86da270.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe57dd2f3-755e-4ab9-ad47-d08ab86da270.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe57dd2f3-755e-4ab9-ad47-d08ab86da270.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}