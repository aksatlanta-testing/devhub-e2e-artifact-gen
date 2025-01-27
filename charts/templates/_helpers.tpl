
{{- define "go-echo4832f034-3938-47ae-8495-2f15bac99eba.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4832f034-3938-47ae-8495-2f15bac99eba.fullname" -}}
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


{{- define "go-echo4832f034-3938-47ae-8495-2f15bac99eba.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4832f034-3938-47ae-8495-2f15bac99eba.labels" -}}
helm.sh/chart: {{ include "go-echo4832f034-3938-47ae-8495-2f15bac99eba.chart" . }}
{{ include "go-echo4832f034-3938-47ae-8495-2f15bac99eba.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4832f034-3938-47ae-8495-2f15bac99eba.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4832f034-3938-47ae-8495-2f15bac99eba.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}