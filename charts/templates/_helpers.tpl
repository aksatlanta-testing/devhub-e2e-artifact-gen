
{{- define "go-echob2e21a05-435e-4e5b-8a00-cc623d92b65e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob2e21a05-435e-4e5b-8a00-cc623d92b65e.fullname" -}}
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


{{- define "go-echob2e21a05-435e-4e5b-8a00-cc623d92b65e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob2e21a05-435e-4e5b-8a00-cc623d92b65e.labels" -}}
helm.sh/chart: {{ include "go-echob2e21a05-435e-4e5b-8a00-cc623d92b65e.chart" . }}
{{ include "go-echob2e21a05-435e-4e5b-8a00-cc623d92b65e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob2e21a05-435e-4e5b-8a00-cc623d92b65e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob2e21a05-435e-4e5b-8a00-cc623d92b65e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}