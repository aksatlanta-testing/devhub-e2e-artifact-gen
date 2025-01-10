
{{- define "go-echo20344bd0-6ad8-49e2-98ce-a014c063292c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo20344bd0-6ad8-49e2-98ce-a014c063292c.fullname" -}}
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


{{- define "go-echo20344bd0-6ad8-49e2-98ce-a014c063292c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo20344bd0-6ad8-49e2-98ce-a014c063292c.labels" -}}
helm.sh/chart: {{ include "go-echo20344bd0-6ad8-49e2-98ce-a014c063292c.chart" . }}
{{ include "go-echo20344bd0-6ad8-49e2-98ce-a014c063292c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo20344bd0-6ad8-49e2-98ce-a014c063292c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo20344bd0-6ad8-49e2-98ce-a014c063292c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}