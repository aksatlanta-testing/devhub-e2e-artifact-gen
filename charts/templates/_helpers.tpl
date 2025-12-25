
{{- define "go-echo9becbbc0-2bce-4ac8-860d-0027c6376478.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9becbbc0-2bce-4ac8-860d-0027c6376478.fullname" -}}
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


{{- define "go-echo9becbbc0-2bce-4ac8-860d-0027c6376478.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9becbbc0-2bce-4ac8-860d-0027c6376478.labels" -}}
helm.sh/chart: {{ include "go-echo9becbbc0-2bce-4ac8-860d-0027c6376478.chart" . }}
{{ include "go-echo9becbbc0-2bce-4ac8-860d-0027c6376478.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9becbbc0-2bce-4ac8-860d-0027c6376478.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9becbbc0-2bce-4ac8-860d-0027c6376478.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}