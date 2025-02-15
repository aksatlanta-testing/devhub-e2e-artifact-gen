
{{- define "go-echobdd7b51e-8872-43a1-ba6a-731b1bd46c10.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobdd7b51e-8872-43a1-ba6a-731b1bd46c10.fullname" -}}
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


{{- define "go-echobdd7b51e-8872-43a1-ba6a-731b1bd46c10.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobdd7b51e-8872-43a1-ba6a-731b1bd46c10.labels" -}}
helm.sh/chart: {{ include "go-echobdd7b51e-8872-43a1-ba6a-731b1bd46c10.chart" . }}
{{ include "go-echobdd7b51e-8872-43a1-ba6a-731b1bd46c10.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobdd7b51e-8872-43a1-ba6a-731b1bd46c10.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobdd7b51e-8872-43a1-ba6a-731b1bd46c10.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}