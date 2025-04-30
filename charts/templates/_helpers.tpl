
{{- define "go-echo4be0e7e5-871c-43ab-9804-141369b6b704.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4be0e7e5-871c-43ab-9804-141369b6b704.fullname" -}}
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


{{- define "go-echo4be0e7e5-871c-43ab-9804-141369b6b704.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4be0e7e5-871c-43ab-9804-141369b6b704.labels" -}}
helm.sh/chart: {{ include "go-echo4be0e7e5-871c-43ab-9804-141369b6b704.chart" . }}
{{ include "go-echo4be0e7e5-871c-43ab-9804-141369b6b704.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4be0e7e5-871c-43ab-9804-141369b6b704.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4be0e7e5-871c-43ab-9804-141369b6b704.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}