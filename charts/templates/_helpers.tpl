
{{- define "go-echo257b749b-278f-4e43-b408-482c95764cce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo257b749b-278f-4e43-b408-482c95764cce.fullname" -}}
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


{{- define "go-echo257b749b-278f-4e43-b408-482c95764cce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo257b749b-278f-4e43-b408-482c95764cce.labels" -}}
helm.sh/chart: {{ include "go-echo257b749b-278f-4e43-b408-482c95764cce.chart" . }}
{{ include "go-echo257b749b-278f-4e43-b408-482c95764cce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo257b749b-278f-4e43-b408-482c95764cce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo257b749b-278f-4e43-b408-482c95764cce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}