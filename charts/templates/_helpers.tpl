
{{- define "go-echoeac236ce-e353-4b6f-ad79-9296d6137d4b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeac236ce-e353-4b6f-ad79-9296d6137d4b.fullname" -}}
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


{{- define "go-echoeac236ce-e353-4b6f-ad79-9296d6137d4b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeac236ce-e353-4b6f-ad79-9296d6137d4b.labels" -}}
helm.sh/chart: {{ include "go-echoeac236ce-e353-4b6f-ad79-9296d6137d4b.chart" . }}
{{ include "go-echoeac236ce-e353-4b6f-ad79-9296d6137d4b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeac236ce-e353-4b6f-ad79-9296d6137d4b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeac236ce-e353-4b6f-ad79-9296d6137d4b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}