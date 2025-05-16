
{{- define "go-echoe84ff869-b17c-4c75-9bf7-a865cb69f791.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe84ff869-b17c-4c75-9bf7-a865cb69f791.fullname" -}}
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


{{- define "go-echoe84ff869-b17c-4c75-9bf7-a865cb69f791.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe84ff869-b17c-4c75-9bf7-a865cb69f791.labels" -}}
helm.sh/chart: {{ include "go-echoe84ff869-b17c-4c75-9bf7-a865cb69f791.chart" . }}
{{ include "go-echoe84ff869-b17c-4c75-9bf7-a865cb69f791.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe84ff869-b17c-4c75-9bf7-a865cb69f791.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe84ff869-b17c-4c75-9bf7-a865cb69f791.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}