
{{- define "go-echo2d34c8dd-b904-42a7-a02b-4fb066487ebf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2d34c8dd-b904-42a7-a02b-4fb066487ebf.fullname" -}}
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


{{- define "go-echo2d34c8dd-b904-42a7-a02b-4fb066487ebf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2d34c8dd-b904-42a7-a02b-4fb066487ebf.labels" -}}
helm.sh/chart: {{ include "go-echo2d34c8dd-b904-42a7-a02b-4fb066487ebf.chart" . }}
{{ include "go-echo2d34c8dd-b904-42a7-a02b-4fb066487ebf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2d34c8dd-b904-42a7-a02b-4fb066487ebf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2d34c8dd-b904-42a7-a02b-4fb066487ebf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}