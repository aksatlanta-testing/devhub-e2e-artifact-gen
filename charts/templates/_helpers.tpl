
{{- define "go-echoa4cb7734-f82f-44c8-9273-936b832cddad.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4cb7734-f82f-44c8-9273-936b832cddad.fullname" -}}
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


{{- define "go-echoa4cb7734-f82f-44c8-9273-936b832cddad.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4cb7734-f82f-44c8-9273-936b832cddad.labels" -}}
helm.sh/chart: {{ include "go-echoa4cb7734-f82f-44c8-9273-936b832cddad.chart" . }}
{{ include "go-echoa4cb7734-f82f-44c8-9273-936b832cddad.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa4cb7734-f82f-44c8-9273-936b832cddad.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa4cb7734-f82f-44c8-9273-936b832cddad.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}