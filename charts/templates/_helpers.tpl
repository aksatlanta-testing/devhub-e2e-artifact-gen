
{{- define "go-echodafc29e8-aa3a-423c-987a-b5deeca49172.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodafc29e8-aa3a-423c-987a-b5deeca49172.fullname" -}}
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


{{- define "go-echodafc29e8-aa3a-423c-987a-b5deeca49172.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodafc29e8-aa3a-423c-987a-b5deeca49172.labels" -}}
helm.sh/chart: {{ include "go-echodafc29e8-aa3a-423c-987a-b5deeca49172.chart" . }}
{{ include "go-echodafc29e8-aa3a-423c-987a-b5deeca49172.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodafc29e8-aa3a-423c-987a-b5deeca49172.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodafc29e8-aa3a-423c-987a-b5deeca49172.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}