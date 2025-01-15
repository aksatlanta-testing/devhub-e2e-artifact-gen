
{{- define "go-echo95da6e61-3ac9-430a-9b97-5a4927be36ee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo95da6e61-3ac9-430a-9b97-5a4927be36ee.fullname" -}}
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


{{- define "go-echo95da6e61-3ac9-430a-9b97-5a4927be36ee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo95da6e61-3ac9-430a-9b97-5a4927be36ee.labels" -}}
helm.sh/chart: {{ include "go-echo95da6e61-3ac9-430a-9b97-5a4927be36ee.chart" . }}
{{ include "go-echo95da6e61-3ac9-430a-9b97-5a4927be36ee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo95da6e61-3ac9-430a-9b97-5a4927be36ee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo95da6e61-3ac9-430a-9b97-5a4927be36ee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}