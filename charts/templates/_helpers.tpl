
{{- define "go-echoec0f81bd-278e-4165-9238-0b59a5438afc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec0f81bd-278e-4165-9238-0b59a5438afc.fullname" -}}
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


{{- define "go-echoec0f81bd-278e-4165-9238-0b59a5438afc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec0f81bd-278e-4165-9238-0b59a5438afc.labels" -}}
helm.sh/chart: {{ include "go-echoec0f81bd-278e-4165-9238-0b59a5438afc.chart" . }}
{{ include "go-echoec0f81bd-278e-4165-9238-0b59a5438afc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoec0f81bd-278e-4165-9238-0b59a5438afc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoec0f81bd-278e-4165-9238-0b59a5438afc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}