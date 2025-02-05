
{{- define "go-echoc54f1f64-af55-450a-9c8f-6216c20d847c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc54f1f64-af55-450a-9c8f-6216c20d847c.fullname" -}}
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


{{- define "go-echoc54f1f64-af55-450a-9c8f-6216c20d847c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc54f1f64-af55-450a-9c8f-6216c20d847c.labels" -}}
helm.sh/chart: {{ include "go-echoc54f1f64-af55-450a-9c8f-6216c20d847c.chart" . }}
{{ include "go-echoc54f1f64-af55-450a-9c8f-6216c20d847c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc54f1f64-af55-450a-9c8f-6216c20d847c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc54f1f64-af55-450a-9c8f-6216c20d847c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}