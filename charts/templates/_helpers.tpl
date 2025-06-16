
{{- define "go-echob87f4859-160a-4ddc-ba5d-90cbb1b5940a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob87f4859-160a-4ddc-ba5d-90cbb1b5940a.fullname" -}}
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


{{- define "go-echob87f4859-160a-4ddc-ba5d-90cbb1b5940a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob87f4859-160a-4ddc-ba5d-90cbb1b5940a.labels" -}}
helm.sh/chart: {{ include "go-echob87f4859-160a-4ddc-ba5d-90cbb1b5940a.chart" . }}
{{ include "go-echob87f4859-160a-4ddc-ba5d-90cbb1b5940a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob87f4859-160a-4ddc-ba5d-90cbb1b5940a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob87f4859-160a-4ddc-ba5d-90cbb1b5940a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}