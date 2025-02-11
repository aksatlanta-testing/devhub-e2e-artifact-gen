
{{- define "go-echo7c4841f4-eff3-482f-8da2-04eda83c8ead.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7c4841f4-eff3-482f-8da2-04eda83c8ead.fullname" -}}
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


{{- define "go-echo7c4841f4-eff3-482f-8da2-04eda83c8ead.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7c4841f4-eff3-482f-8da2-04eda83c8ead.labels" -}}
helm.sh/chart: {{ include "go-echo7c4841f4-eff3-482f-8da2-04eda83c8ead.chart" . }}
{{ include "go-echo7c4841f4-eff3-482f-8da2-04eda83c8ead.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7c4841f4-eff3-482f-8da2-04eda83c8ead.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7c4841f4-eff3-482f-8da2-04eda83c8ead.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}