
{{- define "go-echoe434616e-7c3d-401c-b9b2-ab9f3f3b6223.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe434616e-7c3d-401c-b9b2-ab9f3f3b6223.fullname" -}}
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


{{- define "go-echoe434616e-7c3d-401c-b9b2-ab9f3f3b6223.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe434616e-7c3d-401c-b9b2-ab9f3f3b6223.labels" -}}
helm.sh/chart: {{ include "go-echoe434616e-7c3d-401c-b9b2-ab9f3f3b6223.chart" . }}
{{ include "go-echoe434616e-7c3d-401c-b9b2-ab9f3f3b6223.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe434616e-7c3d-401c-b9b2-ab9f3f3b6223.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe434616e-7c3d-401c-b9b2-ab9f3f3b6223.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}