
{{- define "go-echo9e62bfd5-cd0c-49e6-89e3-b9ff1540c2a8.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9e62bfd5-cd0c-49e6-89e3-b9ff1540c2a8.fullname" -}}
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


{{- define "go-echo9e62bfd5-cd0c-49e6-89e3-b9ff1540c2a8.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9e62bfd5-cd0c-49e6-89e3-b9ff1540c2a8.labels" -}}
helm.sh/chart: {{ include "go-echo9e62bfd5-cd0c-49e6-89e3-b9ff1540c2a8.chart" . }}
{{ include "go-echo9e62bfd5-cd0c-49e6-89e3-b9ff1540c2a8.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9e62bfd5-cd0c-49e6-89e3-b9ff1540c2a8.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9e62bfd5-cd0c-49e6-89e3-b9ff1540c2a8.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}