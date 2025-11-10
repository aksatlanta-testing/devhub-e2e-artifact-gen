
{{- define "go-echof2de124a-6ed9-4a2f-b20e-89e87b2bdf5d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof2de124a-6ed9-4a2f-b20e-89e87b2bdf5d.fullname" -}}
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


{{- define "go-echof2de124a-6ed9-4a2f-b20e-89e87b2bdf5d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof2de124a-6ed9-4a2f-b20e-89e87b2bdf5d.labels" -}}
helm.sh/chart: {{ include "go-echof2de124a-6ed9-4a2f-b20e-89e87b2bdf5d.chart" . }}
{{ include "go-echof2de124a-6ed9-4a2f-b20e-89e87b2bdf5d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof2de124a-6ed9-4a2f-b20e-89e87b2bdf5d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof2de124a-6ed9-4a2f-b20e-89e87b2bdf5d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}