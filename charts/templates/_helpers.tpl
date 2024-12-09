
{{- define "go-echo558bfe1b-3b1a-4325-acb0-099f3359a6ed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo558bfe1b-3b1a-4325-acb0-099f3359a6ed.fullname" -}}
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


{{- define "go-echo558bfe1b-3b1a-4325-acb0-099f3359a6ed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo558bfe1b-3b1a-4325-acb0-099f3359a6ed.labels" -}}
helm.sh/chart: {{ include "go-echo558bfe1b-3b1a-4325-acb0-099f3359a6ed.chart" . }}
{{ include "go-echo558bfe1b-3b1a-4325-acb0-099f3359a6ed.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo558bfe1b-3b1a-4325-acb0-099f3359a6ed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo558bfe1b-3b1a-4325-acb0-099f3359a6ed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}