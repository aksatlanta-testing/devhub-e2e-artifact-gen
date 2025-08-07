
{{- define "go-echo221c0100-5509-49f4-bc82-b365ec258506.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo221c0100-5509-49f4-bc82-b365ec258506.fullname" -}}
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


{{- define "go-echo221c0100-5509-49f4-bc82-b365ec258506.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo221c0100-5509-49f4-bc82-b365ec258506.labels" -}}
helm.sh/chart: {{ include "go-echo221c0100-5509-49f4-bc82-b365ec258506.chart" . }}
{{ include "go-echo221c0100-5509-49f4-bc82-b365ec258506.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo221c0100-5509-49f4-bc82-b365ec258506.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo221c0100-5509-49f4-bc82-b365ec258506.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}