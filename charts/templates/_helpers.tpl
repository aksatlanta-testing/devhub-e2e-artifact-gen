
{{- define "go-echo42032895-d9ec-4858-bc99-c6c8558dc0dc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo42032895-d9ec-4858-bc99-c6c8558dc0dc.fullname" -}}
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


{{- define "go-echo42032895-d9ec-4858-bc99-c6c8558dc0dc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo42032895-d9ec-4858-bc99-c6c8558dc0dc.labels" -}}
helm.sh/chart: {{ include "go-echo42032895-d9ec-4858-bc99-c6c8558dc0dc.chart" . }}
{{ include "go-echo42032895-d9ec-4858-bc99-c6c8558dc0dc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo42032895-d9ec-4858-bc99-c6c8558dc0dc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo42032895-d9ec-4858-bc99-c6c8558dc0dc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}