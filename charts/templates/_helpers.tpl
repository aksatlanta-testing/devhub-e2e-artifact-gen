
{{- define "go-echoc6c89393-8a46-4d6e-9a58-8777dece7682.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc6c89393-8a46-4d6e-9a58-8777dece7682.fullname" -}}
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


{{- define "go-echoc6c89393-8a46-4d6e-9a58-8777dece7682.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc6c89393-8a46-4d6e-9a58-8777dece7682.labels" -}}
helm.sh/chart: {{ include "go-echoc6c89393-8a46-4d6e-9a58-8777dece7682.chart" . }}
{{ include "go-echoc6c89393-8a46-4d6e-9a58-8777dece7682.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc6c89393-8a46-4d6e-9a58-8777dece7682.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc6c89393-8a46-4d6e-9a58-8777dece7682.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}