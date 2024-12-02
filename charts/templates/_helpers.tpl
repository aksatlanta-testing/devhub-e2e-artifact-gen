
{{- define "go-echoace74323-5c57-4063-962e-cfd098e0f586.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoace74323-5c57-4063-962e-cfd098e0f586.fullname" -}}
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


{{- define "go-echoace74323-5c57-4063-962e-cfd098e0f586.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoace74323-5c57-4063-962e-cfd098e0f586.labels" -}}
helm.sh/chart: {{ include "go-echoace74323-5c57-4063-962e-cfd098e0f586.chart" . }}
{{ include "go-echoace74323-5c57-4063-962e-cfd098e0f586.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoace74323-5c57-4063-962e-cfd098e0f586.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoace74323-5c57-4063-962e-cfd098e0f586.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}