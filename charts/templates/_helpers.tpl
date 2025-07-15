
{{- define "go-echoec95099e-e906-4f9a-ad30-b0ec450e532f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec95099e-e906-4f9a-ad30-b0ec450e532f.fullname" -}}
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


{{- define "go-echoec95099e-e906-4f9a-ad30-b0ec450e532f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec95099e-e906-4f9a-ad30-b0ec450e532f.labels" -}}
helm.sh/chart: {{ include "go-echoec95099e-e906-4f9a-ad30-b0ec450e532f.chart" . }}
{{ include "go-echoec95099e-e906-4f9a-ad30-b0ec450e532f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoec95099e-e906-4f9a-ad30-b0ec450e532f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoec95099e-e906-4f9a-ad30-b0ec450e532f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}