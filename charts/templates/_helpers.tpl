
{{- define "go-echoa4958a21-0e57-4431-b6a5-419db3cedafb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4958a21-0e57-4431-b6a5-419db3cedafb.fullname" -}}
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


{{- define "go-echoa4958a21-0e57-4431-b6a5-419db3cedafb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4958a21-0e57-4431-b6a5-419db3cedafb.labels" -}}
helm.sh/chart: {{ include "go-echoa4958a21-0e57-4431-b6a5-419db3cedafb.chart" . }}
{{ include "go-echoa4958a21-0e57-4431-b6a5-419db3cedafb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa4958a21-0e57-4431-b6a5-419db3cedafb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa4958a21-0e57-4431-b6a5-419db3cedafb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}