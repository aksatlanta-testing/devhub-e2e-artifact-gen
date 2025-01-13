
{{- define "go-echoa14a9f36-0596-407d-a0cd-54a1a18a748a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa14a9f36-0596-407d-a0cd-54a1a18a748a.fullname" -}}
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


{{- define "go-echoa14a9f36-0596-407d-a0cd-54a1a18a748a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa14a9f36-0596-407d-a0cd-54a1a18a748a.labels" -}}
helm.sh/chart: {{ include "go-echoa14a9f36-0596-407d-a0cd-54a1a18a748a.chart" . }}
{{ include "go-echoa14a9f36-0596-407d-a0cd-54a1a18a748a.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa14a9f36-0596-407d-a0cd-54a1a18a748a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa14a9f36-0596-407d-a0cd-54a1a18a748a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}