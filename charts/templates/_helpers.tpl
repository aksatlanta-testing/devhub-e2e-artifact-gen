
{{- define "go-echoeecc5463-688d-4069-a90e-2427111cd958.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeecc5463-688d-4069-a90e-2427111cd958.fullname" -}}
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


{{- define "go-echoeecc5463-688d-4069-a90e-2427111cd958.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeecc5463-688d-4069-a90e-2427111cd958.labels" -}}
helm.sh/chart: {{ include "go-echoeecc5463-688d-4069-a90e-2427111cd958.chart" . }}
{{ include "go-echoeecc5463-688d-4069-a90e-2427111cd958.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeecc5463-688d-4069-a90e-2427111cd958.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeecc5463-688d-4069-a90e-2427111cd958.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}