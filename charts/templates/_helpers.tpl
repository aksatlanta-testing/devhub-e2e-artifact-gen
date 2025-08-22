
{{- define "go-echobbe49ad9-a4ae-4c08-843e-f873d6c2186b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobbe49ad9-a4ae-4c08-843e-f873d6c2186b.fullname" -}}
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


{{- define "go-echobbe49ad9-a4ae-4c08-843e-f873d6c2186b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobbe49ad9-a4ae-4c08-843e-f873d6c2186b.labels" -}}
helm.sh/chart: {{ include "go-echobbe49ad9-a4ae-4c08-843e-f873d6c2186b.chart" . }}
{{ include "go-echobbe49ad9-a4ae-4c08-843e-f873d6c2186b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobbe49ad9-a4ae-4c08-843e-f873d6c2186b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobbe49ad9-a4ae-4c08-843e-f873d6c2186b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}