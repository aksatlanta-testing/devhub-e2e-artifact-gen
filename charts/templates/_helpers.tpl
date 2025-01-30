
{{- define "go-echoe3490cc2-7800-419c-9095-65173d2997ae.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe3490cc2-7800-419c-9095-65173d2997ae.fullname" -}}
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


{{- define "go-echoe3490cc2-7800-419c-9095-65173d2997ae.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe3490cc2-7800-419c-9095-65173d2997ae.labels" -}}
helm.sh/chart: {{ include "go-echoe3490cc2-7800-419c-9095-65173d2997ae.chart" . }}
{{ include "go-echoe3490cc2-7800-419c-9095-65173d2997ae.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe3490cc2-7800-419c-9095-65173d2997ae.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe3490cc2-7800-419c-9095-65173d2997ae.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}