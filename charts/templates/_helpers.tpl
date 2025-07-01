
{{- define "go-echo069eefc3-b055-4e1b-a069-2106c906f55c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo069eefc3-b055-4e1b-a069-2106c906f55c.fullname" -}}
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


{{- define "go-echo069eefc3-b055-4e1b-a069-2106c906f55c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo069eefc3-b055-4e1b-a069-2106c906f55c.labels" -}}
helm.sh/chart: {{ include "go-echo069eefc3-b055-4e1b-a069-2106c906f55c.chart" . }}
{{ include "go-echo069eefc3-b055-4e1b-a069-2106c906f55c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo069eefc3-b055-4e1b-a069-2106c906f55c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo069eefc3-b055-4e1b-a069-2106c906f55c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}