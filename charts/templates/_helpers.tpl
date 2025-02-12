
{{- define "go-echo9738dd7a-f821-432f-9185-3d94a98fa29e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9738dd7a-f821-432f-9185-3d94a98fa29e.fullname" -}}
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


{{- define "go-echo9738dd7a-f821-432f-9185-3d94a98fa29e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9738dd7a-f821-432f-9185-3d94a98fa29e.labels" -}}
helm.sh/chart: {{ include "go-echo9738dd7a-f821-432f-9185-3d94a98fa29e.chart" . }}
{{ include "go-echo9738dd7a-f821-432f-9185-3d94a98fa29e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9738dd7a-f821-432f-9185-3d94a98fa29e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9738dd7a-f821-432f-9185-3d94a98fa29e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}