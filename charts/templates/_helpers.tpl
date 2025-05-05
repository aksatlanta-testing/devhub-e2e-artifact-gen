
{{- define "go-echoca85d1cf-e6b6-474c-a5a3-94eb66c3364f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca85d1cf-e6b6-474c-a5a3-94eb66c3364f.fullname" -}}
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


{{- define "go-echoca85d1cf-e6b6-474c-a5a3-94eb66c3364f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca85d1cf-e6b6-474c-a5a3-94eb66c3364f.labels" -}}
helm.sh/chart: {{ include "go-echoca85d1cf-e6b6-474c-a5a3-94eb66c3364f.chart" . }}
{{ include "go-echoca85d1cf-e6b6-474c-a5a3-94eb66c3364f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoca85d1cf-e6b6-474c-a5a3-94eb66c3364f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoca85d1cf-e6b6-474c-a5a3-94eb66c3364f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}