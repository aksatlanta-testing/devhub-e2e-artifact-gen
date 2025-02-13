
{{- define "go-echo45a83122-494e-4733-88c9-a9eca65520ed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo45a83122-494e-4733-88c9-a9eca65520ed.fullname" -}}
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


{{- define "go-echo45a83122-494e-4733-88c9-a9eca65520ed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo45a83122-494e-4733-88c9-a9eca65520ed.labels" -}}
helm.sh/chart: {{ include "go-echo45a83122-494e-4733-88c9-a9eca65520ed.chart" . }}
{{ include "go-echo45a83122-494e-4733-88c9-a9eca65520ed.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo45a83122-494e-4733-88c9-a9eca65520ed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo45a83122-494e-4733-88c9-a9eca65520ed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}