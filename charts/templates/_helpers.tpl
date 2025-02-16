
{{- define "go-echoe74506a2-a8f7-4d8c-a47d-53aef80acbfc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe74506a2-a8f7-4d8c-a47d-53aef80acbfc.fullname" -}}
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


{{- define "go-echoe74506a2-a8f7-4d8c-a47d-53aef80acbfc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe74506a2-a8f7-4d8c-a47d-53aef80acbfc.labels" -}}
helm.sh/chart: {{ include "go-echoe74506a2-a8f7-4d8c-a47d-53aef80acbfc.chart" . }}
{{ include "go-echoe74506a2-a8f7-4d8c-a47d-53aef80acbfc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe74506a2-a8f7-4d8c-a47d-53aef80acbfc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe74506a2-a8f7-4d8c-a47d-53aef80acbfc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}