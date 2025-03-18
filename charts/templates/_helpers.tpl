
{{- define "go-echo4db48340-1853-4679-9690-07fa8a8de003.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4db48340-1853-4679-9690-07fa8a8de003.fullname" -}}
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


{{- define "go-echo4db48340-1853-4679-9690-07fa8a8de003.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4db48340-1853-4679-9690-07fa8a8de003.labels" -}}
helm.sh/chart: {{ include "go-echo4db48340-1853-4679-9690-07fa8a8de003.chart" . }}
{{ include "go-echo4db48340-1853-4679-9690-07fa8a8de003.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4db48340-1853-4679-9690-07fa8a8de003.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4db48340-1853-4679-9690-07fa8a8de003.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}