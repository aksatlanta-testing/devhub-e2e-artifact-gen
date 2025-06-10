
{{- define "go-echo0a1b9045-d43f-415a-a23b-10d07d13e086.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0a1b9045-d43f-415a-a23b-10d07d13e086.fullname" -}}
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


{{- define "go-echo0a1b9045-d43f-415a-a23b-10d07d13e086.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0a1b9045-d43f-415a-a23b-10d07d13e086.labels" -}}
helm.sh/chart: {{ include "go-echo0a1b9045-d43f-415a-a23b-10d07d13e086.chart" . }}
{{ include "go-echo0a1b9045-d43f-415a-a23b-10d07d13e086.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0a1b9045-d43f-415a-a23b-10d07d13e086.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0a1b9045-d43f-415a-a23b-10d07d13e086.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}