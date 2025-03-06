
{{- define "go-echoe64544ff-2516-42e9-a699-de6d6208a26e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe64544ff-2516-42e9-a699-de6d6208a26e.fullname" -}}
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


{{- define "go-echoe64544ff-2516-42e9-a699-de6d6208a26e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe64544ff-2516-42e9-a699-de6d6208a26e.labels" -}}
helm.sh/chart: {{ include "go-echoe64544ff-2516-42e9-a699-de6d6208a26e.chart" . }}
{{ include "go-echoe64544ff-2516-42e9-a699-de6d6208a26e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe64544ff-2516-42e9-a699-de6d6208a26e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe64544ff-2516-42e9-a699-de6d6208a26e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}