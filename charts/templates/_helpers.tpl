
{{- define "go-echoaf4ccace-a234-4f79-adaa-1903459022ab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf4ccace-a234-4f79-adaa-1903459022ab.fullname" -}}
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


{{- define "go-echoaf4ccace-a234-4f79-adaa-1903459022ab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf4ccace-a234-4f79-adaa-1903459022ab.labels" -}}
helm.sh/chart: {{ include "go-echoaf4ccace-a234-4f79-adaa-1903459022ab.chart" . }}
{{ include "go-echoaf4ccace-a234-4f79-adaa-1903459022ab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaf4ccace-a234-4f79-adaa-1903459022ab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaf4ccace-a234-4f79-adaa-1903459022ab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}