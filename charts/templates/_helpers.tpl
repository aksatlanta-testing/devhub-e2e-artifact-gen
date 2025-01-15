
{{- define "go-echo3e861a5a-a140-431b-8a08-52d0d0aa052e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3e861a5a-a140-431b-8a08-52d0d0aa052e.fullname" -}}
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


{{- define "go-echo3e861a5a-a140-431b-8a08-52d0d0aa052e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3e861a5a-a140-431b-8a08-52d0d0aa052e.labels" -}}
helm.sh/chart: {{ include "go-echo3e861a5a-a140-431b-8a08-52d0d0aa052e.chart" . }}
{{ include "go-echo3e861a5a-a140-431b-8a08-52d0d0aa052e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3e861a5a-a140-431b-8a08-52d0d0aa052e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3e861a5a-a140-431b-8a08-52d0d0aa052e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}