
{{- define "go-echoaf2bae30-e360-428c-aa57-1814ea953bb6.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf2bae30-e360-428c-aa57-1814ea953bb6.fullname" -}}
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


{{- define "go-echoaf2bae30-e360-428c-aa57-1814ea953bb6.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf2bae30-e360-428c-aa57-1814ea953bb6.labels" -}}
helm.sh/chart: {{ include "go-echoaf2bae30-e360-428c-aa57-1814ea953bb6.chart" . }}
{{ include "go-echoaf2bae30-e360-428c-aa57-1814ea953bb6.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaf2bae30-e360-428c-aa57-1814ea953bb6.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaf2bae30-e360-428c-aa57-1814ea953bb6.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}