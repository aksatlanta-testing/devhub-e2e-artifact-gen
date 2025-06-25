
{{- define "go-echo639b8dcb-bd61-463a-923b-6839d02de547.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo639b8dcb-bd61-463a-923b-6839d02de547.fullname" -}}
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


{{- define "go-echo639b8dcb-bd61-463a-923b-6839d02de547.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo639b8dcb-bd61-463a-923b-6839d02de547.labels" -}}
helm.sh/chart: {{ include "go-echo639b8dcb-bd61-463a-923b-6839d02de547.chart" . }}
{{ include "go-echo639b8dcb-bd61-463a-923b-6839d02de547.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo639b8dcb-bd61-463a-923b-6839d02de547.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo639b8dcb-bd61-463a-923b-6839d02de547.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}