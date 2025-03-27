
{{- define "go-echod475b208-d530-435c-8248-493921ca2442.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod475b208-d530-435c-8248-493921ca2442.fullname" -}}
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


{{- define "go-echod475b208-d530-435c-8248-493921ca2442.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod475b208-d530-435c-8248-493921ca2442.labels" -}}
helm.sh/chart: {{ include "go-echod475b208-d530-435c-8248-493921ca2442.chart" . }}
{{ include "go-echod475b208-d530-435c-8248-493921ca2442.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod475b208-d530-435c-8248-493921ca2442.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod475b208-d530-435c-8248-493921ca2442.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}