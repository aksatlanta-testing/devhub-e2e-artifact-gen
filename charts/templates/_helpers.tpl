
{{- define "go-echoa88faa03-b8e9-4c76-956d-7194814a676f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa88faa03-b8e9-4c76-956d-7194814a676f.fullname" -}}
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


{{- define "go-echoa88faa03-b8e9-4c76-956d-7194814a676f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa88faa03-b8e9-4c76-956d-7194814a676f.labels" -}}
helm.sh/chart: {{ include "go-echoa88faa03-b8e9-4c76-956d-7194814a676f.chart" . }}
{{ include "go-echoa88faa03-b8e9-4c76-956d-7194814a676f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa88faa03-b8e9-4c76-956d-7194814a676f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa88faa03-b8e9-4c76-956d-7194814a676f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}