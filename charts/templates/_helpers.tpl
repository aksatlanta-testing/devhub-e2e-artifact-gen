
{{- define "go-echo297838fd-85d3-4967-a8ae-43210ffa42de.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo297838fd-85d3-4967-a8ae-43210ffa42de.fullname" -}}
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


{{- define "go-echo297838fd-85d3-4967-a8ae-43210ffa42de.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo297838fd-85d3-4967-a8ae-43210ffa42de.labels" -}}
helm.sh/chart: {{ include "go-echo297838fd-85d3-4967-a8ae-43210ffa42de.chart" . }}
{{ include "go-echo297838fd-85d3-4967-a8ae-43210ffa42de.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo297838fd-85d3-4967-a8ae-43210ffa42de.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo297838fd-85d3-4967-a8ae-43210ffa42de.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}