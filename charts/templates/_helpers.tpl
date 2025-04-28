
{{- define "go-echoa1ed52e8-ba8e-412a-94d4-3c4dcd12b03a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa1ed52e8-ba8e-412a-94d4-3c4dcd12b03a.fullname" -}}
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


{{- define "go-echoa1ed52e8-ba8e-412a-94d4-3c4dcd12b03a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa1ed52e8-ba8e-412a-94d4-3c4dcd12b03a.labels" -}}
helm.sh/chart: {{ include "go-echoa1ed52e8-ba8e-412a-94d4-3c4dcd12b03a.chart" . }}
{{ include "go-echoa1ed52e8-ba8e-412a-94d4-3c4dcd12b03a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa1ed52e8-ba8e-412a-94d4-3c4dcd12b03a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa1ed52e8-ba8e-412a-94d4-3c4dcd12b03a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}