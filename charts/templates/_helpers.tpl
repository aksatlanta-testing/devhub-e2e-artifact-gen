
{{- define "go-echoacce1cf2-76b0-49d9-86aa-c5c6f61c0343.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoacce1cf2-76b0-49d9-86aa-c5c6f61c0343.fullname" -}}
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


{{- define "go-echoacce1cf2-76b0-49d9-86aa-c5c6f61c0343.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoacce1cf2-76b0-49d9-86aa-c5c6f61c0343.labels" -}}
helm.sh/chart: {{ include "go-echoacce1cf2-76b0-49d9-86aa-c5c6f61c0343.chart" . }}
{{ include "go-echoacce1cf2-76b0-49d9-86aa-c5c6f61c0343.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoacce1cf2-76b0-49d9-86aa-c5c6f61c0343.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoacce1cf2-76b0-49d9-86aa-c5c6f61c0343.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}