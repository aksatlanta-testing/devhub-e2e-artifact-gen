
{{- define "go-echo5805096d-c6b9-49f4-9374-b437a576e91d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5805096d-c6b9-49f4-9374-b437a576e91d.fullname" -}}
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


{{- define "go-echo5805096d-c6b9-49f4-9374-b437a576e91d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5805096d-c6b9-49f4-9374-b437a576e91d.labels" -}}
helm.sh/chart: {{ include "go-echo5805096d-c6b9-49f4-9374-b437a576e91d.chart" . }}
{{ include "go-echo5805096d-c6b9-49f4-9374-b437a576e91d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5805096d-c6b9-49f4-9374-b437a576e91d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5805096d-c6b9-49f4-9374-b437a576e91d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}