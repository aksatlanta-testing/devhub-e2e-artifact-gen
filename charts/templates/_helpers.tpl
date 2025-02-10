
{{- define "go-echo42af3e3d-f337-491e-b02a-694d4d78e29d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo42af3e3d-f337-491e-b02a-694d4d78e29d.fullname" -}}
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


{{- define "go-echo42af3e3d-f337-491e-b02a-694d4d78e29d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo42af3e3d-f337-491e-b02a-694d4d78e29d.labels" -}}
helm.sh/chart: {{ include "go-echo42af3e3d-f337-491e-b02a-694d4d78e29d.chart" . }}
{{ include "go-echo42af3e3d-f337-491e-b02a-694d4d78e29d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo42af3e3d-f337-491e-b02a-694d4d78e29d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo42af3e3d-f337-491e-b02a-694d4d78e29d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}