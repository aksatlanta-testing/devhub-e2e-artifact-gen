
{{- define "go-echoa4365e51-d4b0-4253-80cd-7955c79ca2df.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4365e51-d4b0-4253-80cd-7955c79ca2df.fullname" -}}
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


{{- define "go-echoa4365e51-d4b0-4253-80cd-7955c79ca2df.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4365e51-d4b0-4253-80cd-7955c79ca2df.labels" -}}
helm.sh/chart: {{ include "go-echoa4365e51-d4b0-4253-80cd-7955c79ca2df.chart" . }}
{{ include "go-echoa4365e51-d4b0-4253-80cd-7955c79ca2df.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa4365e51-d4b0-4253-80cd-7955c79ca2df.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa4365e51-d4b0-4253-80cd-7955c79ca2df.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}