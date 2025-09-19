
{{- define "go-echo2b0488f1-74da-4eaa-847e-e494fd36f66b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2b0488f1-74da-4eaa-847e-e494fd36f66b.fullname" -}}
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


{{- define "go-echo2b0488f1-74da-4eaa-847e-e494fd36f66b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2b0488f1-74da-4eaa-847e-e494fd36f66b.labels" -}}
helm.sh/chart: {{ include "go-echo2b0488f1-74da-4eaa-847e-e494fd36f66b.chart" . }}
{{ include "go-echo2b0488f1-74da-4eaa-847e-e494fd36f66b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2b0488f1-74da-4eaa-847e-e494fd36f66b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2b0488f1-74da-4eaa-847e-e494fd36f66b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}