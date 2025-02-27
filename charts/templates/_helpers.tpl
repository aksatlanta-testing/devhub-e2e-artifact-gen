
{{- define "go-echoa74b64e6-9334-4a53-9294-2df6ad776f1f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa74b64e6-9334-4a53-9294-2df6ad776f1f.fullname" -}}
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


{{- define "go-echoa74b64e6-9334-4a53-9294-2df6ad776f1f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa74b64e6-9334-4a53-9294-2df6ad776f1f.labels" -}}
helm.sh/chart: {{ include "go-echoa74b64e6-9334-4a53-9294-2df6ad776f1f.chart" . }}
{{ include "go-echoa74b64e6-9334-4a53-9294-2df6ad776f1f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa74b64e6-9334-4a53-9294-2df6ad776f1f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa74b64e6-9334-4a53-9294-2df6ad776f1f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}