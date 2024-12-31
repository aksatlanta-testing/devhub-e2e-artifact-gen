
{{- define "go-echoc33caa23-2d13-474c-827a-917b85899ef9.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc33caa23-2d13-474c-827a-917b85899ef9.fullname" -}}
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


{{- define "go-echoc33caa23-2d13-474c-827a-917b85899ef9.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc33caa23-2d13-474c-827a-917b85899ef9.labels" -}}
helm.sh/chart: {{ include "go-echoc33caa23-2d13-474c-827a-917b85899ef9.chart" . }}
{{ include "go-echoc33caa23-2d13-474c-827a-917b85899ef9.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc33caa23-2d13-474c-827a-917b85899ef9.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc33caa23-2d13-474c-827a-917b85899ef9.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}