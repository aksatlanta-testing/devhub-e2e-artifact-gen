
{{- define "go-echo0ebc3528-0719-4726-bcd7-bc77764d229d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0ebc3528-0719-4726-bcd7-bc77764d229d.fullname" -}}
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


{{- define "go-echo0ebc3528-0719-4726-bcd7-bc77764d229d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0ebc3528-0719-4726-bcd7-bc77764d229d.labels" -}}
helm.sh/chart: {{ include "go-echo0ebc3528-0719-4726-bcd7-bc77764d229d.chart" . }}
{{ include "go-echo0ebc3528-0719-4726-bcd7-bc77764d229d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0ebc3528-0719-4726-bcd7-bc77764d229d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0ebc3528-0719-4726-bcd7-bc77764d229d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}