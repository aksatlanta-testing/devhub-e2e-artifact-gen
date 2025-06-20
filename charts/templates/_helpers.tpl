
{{- define "go-echoe61494f4-049b-4888-80ea-3e1ba04c76bf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe61494f4-049b-4888-80ea-3e1ba04c76bf.fullname" -}}
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


{{- define "go-echoe61494f4-049b-4888-80ea-3e1ba04c76bf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe61494f4-049b-4888-80ea-3e1ba04c76bf.labels" -}}
helm.sh/chart: {{ include "go-echoe61494f4-049b-4888-80ea-3e1ba04c76bf.chart" . }}
{{ include "go-echoe61494f4-049b-4888-80ea-3e1ba04c76bf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe61494f4-049b-4888-80ea-3e1ba04c76bf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe61494f4-049b-4888-80ea-3e1ba04c76bf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}