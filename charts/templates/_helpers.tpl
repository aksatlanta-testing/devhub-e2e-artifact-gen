
{{- define "go-echoff55818f-49b1-455d-8eff-59577be42b2d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff55818f-49b1-455d-8eff-59577be42b2d.fullname" -}}
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


{{- define "go-echoff55818f-49b1-455d-8eff-59577be42b2d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff55818f-49b1-455d-8eff-59577be42b2d.labels" -}}
helm.sh/chart: {{ include "go-echoff55818f-49b1-455d-8eff-59577be42b2d.chart" . }}
{{ include "go-echoff55818f-49b1-455d-8eff-59577be42b2d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoff55818f-49b1-455d-8eff-59577be42b2d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoff55818f-49b1-455d-8eff-59577be42b2d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}