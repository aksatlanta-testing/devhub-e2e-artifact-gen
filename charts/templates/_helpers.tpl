
{{- define "go-echo2ad2d452-5976-4aae-a32e-ee0ae51be31f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2ad2d452-5976-4aae-a32e-ee0ae51be31f.fullname" -}}
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


{{- define "go-echo2ad2d452-5976-4aae-a32e-ee0ae51be31f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2ad2d452-5976-4aae-a32e-ee0ae51be31f.labels" -}}
helm.sh/chart: {{ include "go-echo2ad2d452-5976-4aae-a32e-ee0ae51be31f.chart" . }}
{{ include "go-echo2ad2d452-5976-4aae-a32e-ee0ae51be31f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2ad2d452-5976-4aae-a32e-ee0ae51be31f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2ad2d452-5976-4aae-a32e-ee0ae51be31f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}