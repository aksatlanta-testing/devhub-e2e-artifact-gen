
{{- define "go-echoe5222e05-9b2c-43c3-b4aa-aea0ed13ebbf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe5222e05-9b2c-43c3-b4aa-aea0ed13ebbf.fullname" -}}
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


{{- define "go-echoe5222e05-9b2c-43c3-b4aa-aea0ed13ebbf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe5222e05-9b2c-43c3-b4aa-aea0ed13ebbf.labels" -}}
helm.sh/chart: {{ include "go-echoe5222e05-9b2c-43c3-b4aa-aea0ed13ebbf.chart" . }}
{{ include "go-echoe5222e05-9b2c-43c3-b4aa-aea0ed13ebbf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe5222e05-9b2c-43c3-b4aa-aea0ed13ebbf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe5222e05-9b2c-43c3-b4aa-aea0ed13ebbf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}