
{{- define "go-echoca71f105-e630-4e6a-a21e-9d51ce83bfec.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca71f105-e630-4e6a-a21e-9d51ce83bfec.fullname" -}}
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


{{- define "go-echoca71f105-e630-4e6a-a21e-9d51ce83bfec.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca71f105-e630-4e6a-a21e-9d51ce83bfec.labels" -}}
helm.sh/chart: {{ include "go-echoca71f105-e630-4e6a-a21e-9d51ce83bfec.chart" . }}
{{ include "go-echoca71f105-e630-4e6a-a21e-9d51ce83bfec.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoca71f105-e630-4e6a-a21e-9d51ce83bfec.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoca71f105-e630-4e6a-a21e-9d51ce83bfec.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}