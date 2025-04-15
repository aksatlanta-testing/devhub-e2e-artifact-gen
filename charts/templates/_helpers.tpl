
{{- define "go-echo9fdd5325-a5ea-4571-a31e-291fb55f472d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9fdd5325-a5ea-4571-a31e-291fb55f472d.fullname" -}}
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


{{- define "go-echo9fdd5325-a5ea-4571-a31e-291fb55f472d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9fdd5325-a5ea-4571-a31e-291fb55f472d.labels" -}}
helm.sh/chart: {{ include "go-echo9fdd5325-a5ea-4571-a31e-291fb55f472d.chart" . }}
{{ include "go-echo9fdd5325-a5ea-4571-a31e-291fb55f472d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9fdd5325-a5ea-4571-a31e-291fb55f472d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9fdd5325-a5ea-4571-a31e-291fb55f472d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}