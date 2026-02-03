
{{- define "go-echo0f3cf292-ec63-42f9-b453-a14c874c89ad.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0f3cf292-ec63-42f9-b453-a14c874c89ad.fullname" -}}
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


{{- define "go-echo0f3cf292-ec63-42f9-b453-a14c874c89ad.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0f3cf292-ec63-42f9-b453-a14c874c89ad.labels" -}}
helm.sh/chart: {{ include "go-echo0f3cf292-ec63-42f9-b453-a14c874c89ad.chart" . }}
{{ include "go-echo0f3cf292-ec63-42f9-b453-a14c874c89ad.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0f3cf292-ec63-42f9-b453-a14c874c89ad.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0f3cf292-ec63-42f9-b453-a14c874c89ad.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}