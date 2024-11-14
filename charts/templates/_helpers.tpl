
{{- define "go-echo49e9edfd-9b97-428b-9d38-816ac0874bee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo49e9edfd-9b97-428b-9d38-816ac0874bee.fullname" -}}
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


{{- define "go-echo49e9edfd-9b97-428b-9d38-816ac0874bee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo49e9edfd-9b97-428b-9d38-816ac0874bee.labels" -}}
helm.sh/chart: {{ include "go-echo49e9edfd-9b97-428b-9d38-816ac0874bee.chart" . }}
{{ include "go-echo49e9edfd-9b97-428b-9d38-816ac0874bee.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo49e9edfd-9b97-428b-9d38-816ac0874bee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo49e9edfd-9b97-428b-9d38-816ac0874bee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}