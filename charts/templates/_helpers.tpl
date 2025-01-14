
{{- define "go-echo772b6f82-9123-4386-bbe6-e86c4b74527b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo772b6f82-9123-4386-bbe6-e86c4b74527b.fullname" -}}
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


{{- define "go-echo772b6f82-9123-4386-bbe6-e86c4b74527b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo772b6f82-9123-4386-bbe6-e86c4b74527b.labels" -}}
helm.sh/chart: {{ include "go-echo772b6f82-9123-4386-bbe6-e86c4b74527b.chart" . }}
{{ include "go-echo772b6f82-9123-4386-bbe6-e86c4b74527b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo772b6f82-9123-4386-bbe6-e86c4b74527b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo772b6f82-9123-4386-bbe6-e86c4b74527b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}