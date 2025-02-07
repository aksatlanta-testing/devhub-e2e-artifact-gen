
{{- define "go-echoebf05d2c-a47f-4010-af0c-b99840e229ad.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebf05d2c-a47f-4010-af0c-b99840e229ad.fullname" -}}
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


{{- define "go-echoebf05d2c-a47f-4010-af0c-b99840e229ad.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebf05d2c-a47f-4010-af0c-b99840e229ad.labels" -}}
helm.sh/chart: {{ include "go-echoebf05d2c-a47f-4010-af0c-b99840e229ad.chart" . }}
{{ include "go-echoebf05d2c-a47f-4010-af0c-b99840e229ad.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoebf05d2c-a47f-4010-af0c-b99840e229ad.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoebf05d2c-a47f-4010-af0c-b99840e229ad.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}